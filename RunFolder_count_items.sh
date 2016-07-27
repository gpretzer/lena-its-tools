# Gina M. Pretzer
#
# This tool allows you to run the "readits_count_items.pl" tool on multiple .its files.
# The output information for each .its file is written into an individual .csv file.
#
# Takes the following command line arguments:
# The path and file for this script (e.g. "~/lena-its-tools/RunFolder_count_items.sh")
# 
# Instructions:
# 1.) To use this tool, have all desired .its files in a folder of its own. You may nest folders for each participant within the overall folder. 
#     In this example, the "Participants" folder holds subfolders for each participant where the .its files are stored (e.g. WW01).
# 2.) In line 25, enter the path to the main folder containing the desired .its files (e.g. "~/desktop/Gina/Participants")
# 3.) In line 26, specify any subfolders within the main folder
#	  All the subfolders are named starting with WW, so the * allows for all the WW folders to be opened 
# 4.) Specify the .its file
# 5.) Name the output file (line 29)
#	  This replaces the ".its" ending of the filename to rename the file, and changes the ".its" suffix to ".txt", since the output files are .txt files
# 6.) In line 32, set the path for the "readits_count_items.pl" file (e.g. "~/Desktop/lena-its-tools/readits_start_end_content.pl")
# 7.) Save all changes
# 8.) Launch Terminal
# 9.) Navigate to directory where "RunFolder_readits.sh" is located
# 10.) Run this file (sh RunFolder_count_items.sh )


cd /Volumes/Research/WWTranscription/WWTranscriptionProject/Participants/  ## In this example, "Participants" is the folder that contains the subfolders with the .its files
for folder in WW*  ## The subfolders are named for each participant, all beginning with "WW"
	do cd $folder
		for itsfile in *.its
			do outfile1=`echo $itsfile | sed 's/\.its/CountItemsOutput\.txt/g'`; ## This is where the output file is named
			   perl ~/Desktop/lena-its-tools/readits_count_items.pl $itsfile $outfile1 57600 0 ## This runs the file
			done
	cd ..
	done		