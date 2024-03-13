#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import re
import sys
import os

import argparse
import random

# Create the parser
parser = argparse.ArgumentParser(description='Process an integer argument.')

# Add an argument
parser.add_argument('--randseed', '-s', type=int, help='An integer number')
parser.add_argument('--output', '-o', type=str, help='filename for PDF file')
parser.add_argument('--shuffle_questions', '-sq', action='store_true', help='Shuffle questions globally')
parser.add_argument('--shuffle_choices', '-sc', action='store_true', help='Shuffle multiple choice options')
parser.add_argument('--mark_correct', '-m', action='store_true', help='Mark correct answers')
parser.add_argument('--make_key', '-k', action='store_true', help='include latex key')
# Parse the arguments
args = parser.parse_args()

if args.randseed:
	seed = args.randseed
else:
	seed = 2048

if args.output is None:
	output_name = "Test"
else:
	output_name = args.output

random.seed(seed)

# The markdown text to be converted
markdown_text = open("test.md","r").readlines()
markdown_text = [m for m in markdown_text if m[0] not in ('#',';')]
markdown_text = ''.join(markdown_text)
markdown_text = markdown_text.replace("<", "&lt;")
markdown_text = markdown_text.replace(">", "&gt;")
markdown_text = markdown_text.replace("&", "&amp;")
body = re.split(r'\n+\-\-\-', markdown_text)

# In[ ]:


# Split the text into individual questions
questions = re.split(r'\n+\d+\.\s+', body[0])
questions = [q for q in questions if (len(q)>3)]

# Function to convert a question block into the markup format
def convert_to_markup(question):
		parts = re.split(r'\n\s*[a-e]\.\s+', question)
		question_text = parts[0].strip()
		choices = parts[1:]

		markup = "<Q>\n<t>{}</t>\n".format(question_text)
		for index, choice in enumerate(choices):
				if index == 0:  # Mark the first choice as the correct one
						markup += "<CC> {} </CC>\n".format(choice)
				else:
						markup += "<c> {} </c>\n".format(choice)
		markup += "</Q>\n"
		return markup

# Convert each question to markup and combine
markup_text = "\n".join([convert_to_markup(q) for q in questions if q])

f = open("question_bank.txt","w")
f.write(markup_text)
f.close()


# In[ ]:


import xml.etree.ElementTree as ET

# Define the class structures
class Choice:
		def __init__(self, text, correct=False):
				self.text = text
				self.correct = correct

class Question:
		def __init__(self, text, choices=[]):
				self.text = text
				self.choices = choices

		def add_choice(self, choice):
				self.choices.append(choice)


# In[ ]:


import random

# Sample markup text
markup_text = open("question_bank.txt", "r").read()

def parse_markup(markup_text):
		# Parse the markup text into an ElementTree
		root = ET.fromstring("<root>" + markup_text + "</root>")

		questions = []

		# Iterate over each question in the markup
		for q_elem in root.findall('Q'):
				question_text = q_elem.find('t').text
				choices = []

				# Iterate over each choice in the question
				for c_elem in q_elem.findall('c'):
						choices.append(Choice(text=c_elem.text, correct=False))
				for cc_elem in q_elem.findall('CC'):
						choices.append(Choice(text=cc_elem.text, correct=True))

				question = Question(text=question_text, choices=choices)
				questions.append(question)

		return questions

# Parse the markup text
questions = parse_markup(markup_text)
if args.shuffle_questions:
	random.shuffle(questions)
if args.shuffle_choices:
	for q in questions:
		random.shuffle(q.choices)

def xml2text(s):
		s = s.replace("&lt;", "<")
		s = s.replace("&gt;", ">")
		s = s.replace("&amp;", "&")
		return s

def xml2markdown():
	outfile = open("test-new.md","w")
	# Display the parsed questions and choices
	for question in questions:
			question.text = xml2text(question.text)
			outfile.write("1.  "+question.text+"\n")
			for choice in question.choices:
					choice.text = xml2text(choice.text)
					if choice.correct:
							decoration = "\u2713"
					else:
							decoration = ""
					outfile.write(f"    a.  {choice.text} {decoration}"+"\n")
	outfile.close()

def make_key():
	output = ""
	if args.make_key:
		output = "\\clearpage\n"
		output += "\\textbf{KEY}\n"
		output += "\\begin{enumerate}\n"

		letters = ['A','B','C','D','E']
		for n, q in enumerate(questions):
			for i, c in enumerate(q.choices):
				if c.correct:
					output += "\t\\item " + letters[i] + "\n"
	output += "\\end{enumerate}\n"
	return output

def convert_xml_to_latex():
		outfile = open("test-temp.tex","w")
		latex_output = "\\documentclass{article}\n\\usepackage{amsmath}\n"
		latex_output += "\\usepackage[top=2cm,left=2cm,right=1cm,bottom=2cm]{geometry}\n"
		latex_output += "\\usepackage{fancyhdr}\n"
		latex_output += "\\usepackage{graphicx}\n"
		latex_output += "\\begin{document}\n"
		latex_output += "\\pagestyle{fancy}\n\\fancyhf{}\n"
		latex_output += f"\\lfoot{{Test ID: {seed} }} \\rfoot{{Page: \\thepage}}\n\n"
		latex_output += "\\renewcommand{\\footrulewidth}{0.4pt}\n"
		latex_output += "\\begin{enumerate}\n\t\\itemsep2em\n"

		for question in questions:
			question.text = xml2text(question.text)
			latex_output += "\t\\item\n\t\\begin{minipage}[t]{\\linewidth}\n"
			latex_output += "\t\t" + question.text + "\n\n"
			latex_output += "\t\t\\begin{enumerate}\n"

			for choice in question.choices:
					choice.text = xml2text(choice.text)
					if not choice.correct:
							latex_output += "\t\t\t\\item " + choice.text + "\n"
					elif choice.correct and args.mark_correct:
							latex_output += "\t\t\t\\item (*) " + choice.text + "\n"
					elif choice.correct and not args.mark_correct:
							latex_output += "\t\t\t\\item " + choice.text + "\n"

			latex_output += "\t\t\\end{enumerate}\n"
			latex_output += "\t\\end{minipage}\n"

		latex_output += "\\end{enumerate}\n"
		latex_output += make_key()

		latex_output += "\\end{document}"

		outfile.write(latex_output)
		outfile.close()
		return latex_output


convert_xml_to_latex()
os.system("pdflatex test-temp.tex")
os.system(f"pdfunite Cover\\ Page.pdf test-temp.pdf {output_name}-{seed}.pdf")
os.system("rm test-temp.*")
os.system("rm question_bank.txt")