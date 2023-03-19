outdir = getDirectory("Pick output directory");
for (i = 1; i <= nImages; ++i) {
    selectImage(i);
    title = replace(getTitle, "/", ".");
    print("Saving " + title);
    saveAs("tiff", outdir + title);
}
