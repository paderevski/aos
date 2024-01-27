mcprocessanswers <- function(ID,versions,answers,path=getwd()) {
 
tol <- .Machine$double.eps^0.5 
if(! is.numeric(answers)) stop("non-numeric value(s) in answers, mcprocessanswers stopped") 
if(min(answers > tol)==0) stop("non-positive value(s) in answers, mcprocessanswers stopped") 
if(min(abs(answers - round(answers)) < tol)==0) stop("non-integer value(s) in answers, mcprocessanswers stopped") 
if(! is.numeric(versions)) stop("non-numeric value(s) in versions, mcprocessanswers stopped") 
if(min(versions > tol)==0) stop("non-positive value(s) in versions, mcprocessanswers stopped") 
if(min(abs(versions - round(versions)) < tol)==0) stop("non-integer value(s) in versions, mcprocessanswers stopped") 
if(min(versions-2< tol)==0) stop("value(s) in versions too large, maximum possible value is 2, mcprocessanswers stopped") 
 
questiondictionary=list(c(2,3,4,5,6,7,1),c(1,2,3,4,5,6,7))
 
randomizedanswersdictionary=list(
 list(c(4,3,2,1),c(1,2),c(1,2),c(1,2),c(1,2),c(1,2),c(3,4,2,1,5))
 ,list(c(1,2,3,4),c(1,2),c(1,2),c(1,2),c(1,2),c(1,2),c(1,4,3,5,2))
 )
 
correctiondictionary=list(c(0,0,1,0),c(1,0),c(1,0),c(1,0),c(0,1),c(0,1),c(1,0,0,0,0))
 
Nversions=2; 
Nquestions=7;
Nanswers=c(4,2,2,2,2,2,5);
Nstudents=nrow(answers);
 
Q <- matrix(NA,nrow=Nstudents,ncol=Nquestions); 
P <- matrix(NA,nrow=Nstudents,ncol=Nquestions); 
for ( student in 1:Nstudents ){
 for (question in 1:Nquestions){
 R <- randomizedanswersdictionary[[versions[student]]][[question]]; 
 Q[student,question] <- R[answers[student,questiondictionary[[versions[student]]][question]]]; 
 P[student,question] <- correctiondictionary[[question]][Q[student,question]]; 
 P[student,question] <- ifelse(is.na(P[student,question]),0,P[student,question]); 
 }}
Points=apply(P,1,sum); 
outputdata <- data.frame(ID=ID,versions=versions,originalQuestion=Q,pointsQuestion=P,total=Points); 
 
p <- apply(P,2,mean); 
p.cor <- apply(P,2,mean) - (1-apply(P,2,mean))/(Nanswers-unlist(lapply(correctiondictionary,sum))); 
r.cor <- NULL; 
for (i in 1:Nquestions){
 r.cor[i] <- ifelse(var(P[,i])==0,0,cor(P[,i],apply(P[,-i],1,sum))); 
 }
 
Nquestions.cor <- sum(apply(P,2,var)>0); 
alpha <- (Nquestions.cor/(Nquestions.cor-1))*(1-(sum(apply(P,2,var))/var(Points))); 
 
outputfilename=file.path(path,"mc.ana"); 
write("\\makeatletter",outputfilename) ; 
 
formatnumber <- function(x) {
 y <- gsub("(?<![0-9.])0+","", sprintf("%.3f",x),perl = TRUE) 
 n <- nchar(y) 
 y <- gsub(" ","\\\\phantom{-}",y) 
 y <- paste0(strrep("\\phantom{0}",max(n)-n),y) 
 y 
 }; 
write(c( 
 "\\gdef\\mc@questionAnalysisTable{", 
 " \\begin{setmcquestionanalysistable}", 
 " \\begin{longtable}{cccc}", 
 " & \\mc@babel@Proportion & \\mc@babel@Corrected & \\mc@babel@Item@rest \\\\", 
 " & \\mc@babel@correct & \\mc@babel@proportion & \\mc@babel@correlation \\\\", 
 " \\hline", 
 " \\mc@babel@Question \\\\", 
 " \\endhead", 
 " \\hline", 
 " \\endfoot", 
 " \\hline", 
 paste0(" \\multicolumn{4}{l}{\\mc@babel@Number@of@students\\ = ",Nstudents,"}\\\\"), 
 paste0(" \\multicolumn{4}{l}{Cronbach's alpha = ",sprintf("%.3f",alpha),"}\\\\"), 
 " \\endlastfoot ", 
 paste0(" \\setcounter{mc@counter}{",1:ncol(answers),"}\\mcquestionlabelfmt{mc@counter}& " 
 ,formatnumber(p)," & ",formatnumber(p.cor)," & ",formatnumber(r.cor)," \\\\"), 
 " \\end{longtable}", 
 " \\end{setmcquestionanalysistable}", 
 " }" 
 ),outputfilename,append=TRUE) ; 
 
versions.factor <- factor(versions); 
levels(versions.factor) <- 1:Nversions; 
for (i in 1:Nquestions) {
 X <- factor(Q[,i],1:Nanswers[i]); 
 props <- cbind(prop.table(table(X,versions.factor,useNA="ifany"),2),prop.table(table(X,useNA="ifany"))); 
 dims <- dim(props); 
 props <- lapply(props,function(x) ifelse(is.na(x),"N.A.",gsub(" ","\\\\phantom{0}",paste0(sprintf("%5.1f",x*100),"\\%")))); 
 dim(props) <- dims; 
 props <- apply(props, 1, paste, collapse=" & "); 
 labels <- paste0(" \\setcounter{mc@counter}{",1:Nanswers[i],"}\\mcanswerlabelfmt{mc@counter}"); 
 labels <- ifelse(is.na(labels[1:dims[1]])," invalid",labels[1:dims[1]]) 
write(c( 
 paste0("\\csgdef{mc@answerAnalysisTable",i,"}{"), 
 paste0(" \\begin{tabular}{c",strrep("c",Nversions),"c}"), 
 paste0(" \\multicolumn{1}{r}{\\mc@babel@Version}&" 
 ,paste(paste0("\\setcounter{mc@counter}{",1:Nversions, 
 "}\\mcversionlabelfmt{mc@counter}"),collapse="&") 
 ," & \\mc@babel@total \\\\"), 
 " \\hline", 
 " \\mc@babel@Answer \\\\", 
 paste0(labels," & ",props,"\\\\"), 
 " \\hline", 
 paste0(" \\multicolumn{",Nversions+2,"}{l}{\\mc@babel@Proportion@correct\\ = ", 
 sprintf("%.3f",p[i]),"}\\\\"), 
 paste0(" \\multicolumn{",Nversions+2,"}{l}{\\mc@babel@Corrected@proportion\\ = ", 
 sprintf("%.3f",p.cor[i]),"}\\\\"), 
 paste0(" \\multicolumn{",Nversions+2,"}{l}{\\mc@babel@Item@rest@correlation\\ = ", 
 sprintf("%.3f",r.cor[i]),"}\\\\"), 
 " \\end{tabular}", 
 " }" 
 ),outputfilename,append=TRUE) ; 
 }
 
write("\\makeatother",outputfilename,append=TRUE) ; 
 
outputdata ; 
 }
