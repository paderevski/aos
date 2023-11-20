function showMore(elementID) {
    var moreText = document.getElementById(elementID);
    var linkText = moreText.nextElementSibling; // Assuming the link is just before the hidden text

    if (moreText.style.display === "none") {
        moreText.style.display = "inline";
        linkText.innerHTML = "Show Less"; 
    } else {
        moreText.style.display = "none";
        linkText.innerHTML = "Show More";
    }
}
