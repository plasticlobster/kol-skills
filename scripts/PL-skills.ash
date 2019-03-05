string get_lovebug() {
   if (get_property("lovebugsUnlocked") == 'true') {
      return "Lovebug Combat Skills (HP)\r\n";
   }
   return "";
}

skill[int] get_bookshelf_skills() {
   skill[int] skills;
   file_to_map('https://raw.githubusercontent.com/plasticlobster/kol-skills/master/data/PL-bookshelf_skills.txt', skills);

   skill[int] skills_permed;

   foreach a in skills {
      if (have_skill(skills[a])) {
         skills_permed[count(skills_permed)] = skills[a];
      }
   }
   return skills_permed;
}

string get_other_skills() {
   string charsheet = visit_url("/charsheet.php");
   string skills = "";

   matcher skill_matcher_sc = create_matcher("<a onClick\\='javascript:.*?[>]([^<]*?)</a> \\(P\\)", charsheet);
   matcher skill_matcher_hc = create_matcher("<a onClick\\='javascript:.*?[>]([^<]*?)</a> \\(<b>HP</b>\\)", charsheet);

   while (find(skill_matcher_hc)) {
      skills = skills + group(skill_matcher_hc, 1) + " (HP)\r\n";
   }
   while (find(skill_matcher_sc)) {
      skills = skills + group(skill_matcher_sc, 1) + " (P)\r\n";
   }
   return skills;
}

string post(string skills) {
   return visit_url("http://www.plasticlobster.com/index.php?mafia=true&skills="+url_encode(skills));
}

void main() {
   string regular_skills = get_other_skills();
   skill[int] bookshelf_skills = get_bookshelf_skills();
   string bss = "";
   foreach a in bookshelf_skills {
      bss = bss + to_string(bookshelf_skills[a]) + " (HP)\r\n";
   }
   string final_skills = regular_skills + bss + get_lovebug();
   string url = post(final_skills);

   print("Success! Your skills have been uploaded!", "green");
   print("Visit: "+url+" to see your skill breakdown.", "blue");
}
