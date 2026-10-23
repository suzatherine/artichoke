#!/bin/bash
set -e

# EVERYTHING TO START AS KS1 ENG 

# Explicitly reset the source before the first build, even if a previous run
# stopped before restoring the KS1 Eng settings.
sed -E -i '' 's/"start": "landing-ks[12]-(eng|cym)",/"start": "landing-ks1-eng",/' twine.twee
sed -E -i '' 's/"ifid": "[^"]*",/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0C",/' twine.twee
sed -E -i '' 's/setup.buildID = "[^"]*";/setup.buildID = "ks1-eng";/' twine.twee
sed -E -i '' 's/^Artichoke Templating( - KS[12] (Eng|Cym))*$/Artichoke Templating - KS1 Eng/' twine.twee

# Compile the Twine file
tweego twine.twee -o ks1-eng.html

# Change the StoryData start passage - KS1 Eng to KS2 Eng
sed -i '' 's/"start": "landing-ks1-eng",/"start": "landing-ks2-eng",/' twine.twee
sed -i '' 's/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0C",/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0D",/' twine.twee
sed -i '' 's/setup.buildID = "ks1-eng";/setup.buildID = "ks2-eng";/' twine.twee
sed -i '' 's/Artichoke Templating - KS1 Eng/Artichoke Templating - KS2 Eng/' twine.twee

# Compile the Twine file
tweego twine.twee -o ks2-eng.html

# Change the StoryData start passage - KS2 Eng to KS1 Cym
sed -i '' 's/"start": "landing-ks2-eng",/"start": "landing-ks1-cym",/' twine.twee
sed -i '' 's/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0D",/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0E",/' twine.twee
sed -i '' 's/setup.buildID = "ks2-eng";/setup.buildID = "ks1-cym";/' twine.twee
sed -i '' 's/Artichoke Templating - KS2 Eng/Artichoke Templating - KS1 Cym/' twine.twee

# Compile the Twine file
tweego twine.twee -o ks1-cym.html

# Change the StoryData start passage - KS1 Cym to KS2 Cym
sed -i '' 's/"start": "landing-ks1-cym",/"start": "landing-ks2-cym",/' twine.twee
sed -i '' 's/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0E",/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0F",/' twine.twee
sed -i '' 's/setup.buildID = "ks1-cym";/setup.buildID = "ks2-cym";/' twine.twee
sed -i '' 's/Artichoke Templating - KS1 Cym/Artichoke Templating - KS2 Cym/' twine.twee

# Compile the Twine file
tweego twine.twee -o ks2-cym.html

# Change the StoryData start passage - KS2 Cym to KS1 Eng
sed -i '' 's/"start": "landing-ks2-cym",/"start": "landing-ks1-eng",/' twine.twee
sed -i '' 's/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0F",/"ifid": "D0D58254-464A-48E7-BEBF-156628EC9A0C",/' twine.twee
sed -i '' 's/setup.buildID = "ks2-cym";/setup.buildID = "ks1-eng";/' twine.twee
sed -i '' 's/Artichoke Templating - KS2 Cym/Artichoke Templating/' twine.twee