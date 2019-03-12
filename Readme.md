This is a KoLMafia interface for the skill progression tracking available on plasticlobster.com

Guide
=====

To install, type:
----------------------
<pre>
svn checkout https://github.com/plasticlobster/kol-skills/branches/Release
</pre>

in your KoLMafia CLI


To update, type:
----------------------
<pre>
svn update plasticlobster-kol-skills-branches-Release
svn sync
</pre>
svn sync is necessary because sometimes KoLMafia doesn't move updates to the scripts folder.

To remove:
----------------------
<pre>
svn delete plasticlobster-kol-skills-branches-Release
</pre>

Usage:
----------------------
<pre>
PL-skills
</pre>

Similar to the various "snapshot" scripts out there, this one will check your account for permed skills and direct you to a page that shows you how you're progressing.
The skill breakdowns are periodically updated based on the ~~KoLWiki's Hardcore Skill Analysis page~~ 
[The Ascension Speed Show's Hardcore (and Softcore) Standard Perm Tier List](https://docs.google.com/spreadsheets/d/1UG68Vl_5V-EqQXdyF2QMehdZ43Gh78pwD3R0UC_bky4/), so those who are perming skills in accordance with that page may find this script and supporting web site helpful.

