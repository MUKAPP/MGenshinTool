LanguageTable_Simplified_Chinese={
  应急食品="应急食品",
  main={
    正在加载="正在加载…"
  }
}
LanguageTable_traditional_Chinese={
  应急食品="應急食品",
  main={
    正在加载="正在加載…"
  }
}
LanguageTable_English={
  应急食品="Emergency food",
  main={
    正在加载="loading…"
  }
}

function setLanguage(lan)
  if lan=="Simplified_Chinese" then
    --print("中文")
    LanguageTable=LanguageTable_Simplified_Chinese
   elseif lan=="traditional_Chinese" then
    --print("繁体中文")
    LanguageTable=LanguageTable_traditional_Chinese
   elseif lan=="English" then
    --print("英文")
    LanguageTable=LanguageTable_English
   else
    --print("-中文")
    LanguageTable=LanguageTable_Simplified_Chinese
  end
end

function getLanguage(act,name)
  if name==nil then
    if LanguageTable[act] then
      return LanguageTable[act]
     else
      return LanguageTable_Simplified_Chinese[act]
    end
   else
    if LanguageTable[act][name] then
      return LanguageTable[act][name]
     else
      return LanguageTable_Simplified_Chinese[act][name]
    end
  end
end
