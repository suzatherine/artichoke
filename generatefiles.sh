#!/bin/bash

# EVERYTHING TO START AS KS1 ENG 

# Compile the Twine file
tweego twine.twee -o ks1-eng.html

# Change the StoryData start passage - KS1 Eng to KS2 Eng
sed -i '' 's/"start": "landing-ks1-eng",/"start": "landing-ks2-eng",/' twine.twee
sed -i '' 's/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0C",/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0D",/' twine.twee
sed -i '' 's/setup.buildID = "ks1-eng";/setup.buildID = "ks2-eng";/' twine.twee

# Compile the Twine file
tweego twine.twee -o ks2-eng.html

# Change the StoryData start passage - KS2 Eng to KS1 Cym
sed -i '' 's/"start": "landing-ks2-eng",/"start": "landing-ks1-cym",/' twine.twee
sed -i '' 's/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0D",/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0E",/' twine.twee
sed -i '' 's/setup.buildID = "ks2-eng";/setup.buildID = "ks1-cym";/' twine.twee

# Compile the Twine file
tweego twine.twee -o ks1-cym.html

# Change the StoryData start passage - KS1 Cym to KS2 Cym
sed -i '' 's/"start": "landing-ks1-cym",/"start": "landing-ks2-cym",/' twine.twee
sed -i '' 's/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0E",/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0F",/' twine.twee
sed -i '' 's/setup.buildID = "ks1-cym";/setup.buildID = "ks2-cym";/' twine.twee


# Compile the Twine file
tweego twine.twee -o ks2-cym.html

# Change the StoryData start passage - KS2 Cym to KS1 Eng
sed -i '' 's/"start": "landing-ks2-cym",/"start": "landing-ks1-eng",/' twine.twee
sed -i '' 's/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0F",/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0C",/' twine.twee
sed -i '' 's/setup.buildID = "ks2-cym";/setup.buildID = "ks1-eng";/' twine.twee