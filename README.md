# UnitsortingPipeline-Kilosort
This Repo contains all the scripts to Extract, Sort, and Analyze our Micro-electrode Subjects


Step 1: Turn your data into a binary file in int16 format
  - You must only make a binary file from the channels which can be sorted. No extra channels like dead channels or trigger channels, ideally
  
Step 2: Create a Channel Map
  - Kilosort expects that you specify the configuration of your electrode. To do that, you must use the MakeChanMapFile script. This comes with Kilosort anyway, so nothing groundbreaking in my version. In this file, you will specify:
      1) The number of channels
      2) The subset of channels to be sorted
      3) The coordinates of the electrode contacts in microns
      4) Sampling Rate
      
  - This must be saved into the config folder in the Kilosort directory
  
Step 3: Ensure your config file is correct
     -You should check through the config file and make sure everything makes sense. You should only ever NEED to change the channel map. You can definitely play around with these parameters. This is the place where you set the High-Pass filter, the Threshold for sorting, and Batch sizes, among other things. If you have a tiny recording, you'll at least need to shrink the batch size to potentially get it to sort.
     
Step 4: Kilosort it!
 - Using the kilosort_master script or the Kilosort gui, you can set the variables to the correct path to your binary file, ensure you have the correct config and chan map, and start sorting. It very rarely takes more than 10 minutes.
