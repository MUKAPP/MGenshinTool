return {
  --3 star--
  {
    eng = "adventurer",
    chs = "冒险家",
    name2 = "Adventurer",
    minStar = 1,
    maxStar = 3,
    effect2 = "生命值上限提升1000点。",
    effect4 = "生命值上限提升1000点。",
    {"冒险家之花", "flower"},
    {"冒险家尾羽", "feather"},
    {"冒险家怀表", "sand"},
    {"冒险家金杯", "cup"},
    {"冒险家头带", "head"},
    config4 = {}
  },
  {
    eng = "luckyDog",
    chs = "幸运儿",
    name2 = "LuckyDog",
    minStar = 1,
    maxStar = 3,
    effect2 = "防御力提高100点。",
    effect4 = "拾取摩拉时，恢复300点生命值。",
    {"幸运儿绿花", "flower"},
    {"幸运儿鹰羽", "feather"},
    {"幸运儿沙漏", "sand"},
    {"幸运儿之杯", "cup"},
    {"幸运儿银冠", "head"},
    config4 = {}
  },
  {
    eng = "travelingDoctor",
    chs = "游医",
    name2 = "TravelingDoctor",
    minStar = 1,
    maxStar = 3,
    effect2 = "角色受到的治疗效果提高20%。",
    effect4 = "施放元素爆发时，恢复20%生命值。",
    {"游医的银莲", "flower"},
    {"游医的枭羽", "feather"},
    {"游医的怀钟", "sand"},
    {"游医的药壶", "cup"},
    {"游医的方巾", "head"},
    config4 = {}
  },
  --4 star--
  {
    eng = "berserker",
    chs = "战狂",
    name2 = "Berserker",
    minStar = 3,
    maxStar = 4,
    effect2 = "暴击率提高12%。",
    effect4 = "生命值低于70%时，暴击率额外提高24%。",
    {"战狂的蔷薇", "flower"},
    {"战狂的翎羽", "feather"},
    {"战狂的时计", "sand"},
    {"战狂的骨杯", "cup"},
    {"战狂的鬼面", "head"},
    config4 = {
      {
        ["default"] = 0.0,
        ["max"] = 1.0,
        ["min"] = 0.0,
        ["name"] = "rate",
        ["title"] = "效果应用比例",
        ["type"] = "float"
      }
    }
  },
  {
    eng = "braveHeart",
    chs = "勇士之心",
    name2 = "BraveHeart",
    minStar = 3,
    maxStar = 4,
    effect2 = "攻击力提高18%。",
    effect4 = "对生命值高于50%的敌人，造成的伤害增加30%。",
    {"勇士的勋章", "flower"},
    {"勇士的期许", "feather"},
    {"勇士的坚毅", "sand"},
    {"勇士的壮行", "cup"},
    {"勇士的冠冕", "head"},
    config4 = {
      {
        ["default"] = 0.0,
        ["max"] = 1.0,
        ["min"] = 0.0,
        ["name"] = "rate",
        ["title"] = "效果应用比例",
        ["type"] = "float"
      }
    }
  },
  {
    eng = "gambler",
    chs = "赌徒",
    name2 = "Gambler",
    minStar = 3,
    maxStar = 4,
    effect2 = "元素战技造成的伤害提升20%。",
    effect4 = "击败敌人时，有100%概率清除元素战技的冷却时间。该效果每15秒至多触发一次。",
    {"赌徒的胸花", "flower"},
    {"赌徒的羽饰", "feather"},
    {"赌徒的怀表", "sand"},
    {"赌徒的骰蛊", "cup"},
    {"赌徒的耳环", "head"},
    config4 = {}
  },
  {
    eng = "instructor",
    chs = "教官",
    name2 = "Instructor",
    minStar = 3,
    maxStar = 4,
    effect2 = "元素精通提高80点。",
    effect4 = "触发元素反应后。队伍中所有角色元素精通提高120点，持续8秒。",
    {"教官的胸花", "flower"},
    {"教官的羽饰", "feather"},
    {"教官的怀表", "sand"},
    {"教官的茶杯", "cup"},
    {"教官的帽子", "head"},
    config4 = {
      {
        ["default"] = 0.0,
        ["max"] = 1.0,
        ["min"] = 0.0,
        ["name"] = "rate",
        ["title"] = "效果应用比例",
        ["type"] = "float"
      }
    }
  },
  {
    eng = "martialArtist",
    chs = "武人",
    name2 = "MartialArtist",
    minStar = 3,
    maxStar = 4,
    effect2 = "普通攻击与重击造成的伤害提高15%。",
    effect4 = "施放元素战技后的8秒内，普通攻击和重击造成的伤害提升25%。",
    {"武人的红花", "flower"},
    {"武人的羽饰", "feather"},
    {"武人的水漏", "sand"},
    {"武人的酒杯", "cup"},
    {"武人的头巾", "head"},
    config4 = {
      {
        ["default"] = 0.0,
        ["max"] = 1.0,
        ["min"] = 0.0,
        ["name"] = "rate",
        ["title"] = "效果应用比例",
        ["type"] = "float"
      }
    }
  },
  {
    eng = "prayersForDestiny",
    chs = "祭水之人",
    name2 = "PrayersForDestiny",
    minStar = 3,
    maxStar = 4,
    effect2 = "",
    effect4 = "",
    {"祭水礼冠", "head"},
    config4 = {}
  },
  {
    eng = "prayersForIllumination",
    chs = "祭火之人",
    name2 = "PrayersForIllumination",
    minStar = 3,
    maxStar = 4,
    effect2 = "",
    effect4 = "",
    {"祭火礼冠", "head"},
    config4 = {}
  },
  {
    eng = "prayersForWisdom",
    chs = "祭雷之人",
    name2 = "PrayersForWisdom",
    minStar = 3,
    maxStar = 4,
    effect2 = "",
    effect4 = "",
    {"祭雷礼冠", "head"},
    config4 = {}
  },
  {
    eng = "prayersToSpringtime",
    chs = "祭冰之人",
    name2 = "PrayersToSpringtime",
    minStar = 3,
    maxStar = 4,
    effect2 = "",
    effect4 = "",
    {"祭冰礼冠", "head"},
    config4 = {}
  },
  {
    eng = "resolutionOfSojourner",
    chs = "行者之心",
    name2 = "ResolutionOfSojourner",
    minStar = 3,
    maxStar = 4,
    effect2 = "攻击力提高18%。",
    effect4 = "重击的暴击率提高30%。",
    {"故人之心", "flower"},
    {"归乡之羽", "feather"},
    {"逐光之石", "sand"},
    {"异国之盏", "cup"},
    {"感别之冠", "head"},
    config4 = {}
  },
  {
    eng = "scholar",
    chs = "学士",
    name2 = "Scholar",
    minStar = 3,
    maxStar = 4,
    effect2 = "元素充能效率提高20%。",
    effect4 = "获得元素微粒或元素晶球时，队伍中所有弓箭和法器角色额外恢复3点元素能量。该效果每3秒只能触发一次。",
    {"学士的书签", "flower"},
    {"学士的羽笔", "feather"},
    {"学士的时钟", "sand"},
    {"学士的墨杯", "cup"},
    {"学士的镜片", "head"},
    config4 = {}
  },
  {
    eng = "exile",
    chs = "流放者",
    name2 = "TheExile",
    minStar = 3,
    maxStar = 4,
    effect2 = "元素充能效率提高20%。",
    effect4 = "施放元素爆发后，每2秒为队伍中所有角色（不包括自己）恢复2点元素能量。该效果持续6秒，无法叠加。",
    {"流放者之花", "flower"},
    {"流放者之羽", "feather"},
    {"流放者怀表", "sand"},
    {"流放者之杯", "cup"},
    {"流放者头冠", "head"},
    config4 = {}
  },
  {
    eng = "tinyMiracle",
    chs = "奇迹",
    name2 = "TinyMiracle",
    minStar = 3,
    maxStar = 4,
    effect2 = "所有元素抗性提高20%。",
    effect4 = "受到某个元素类型的伤害后，相应的抗性提升30%，持续10秒。该效果每10秒只能触发一次。",
    {"奇迹之花", "flower"},
    {"奇迹之羽", "feather"},
    {"奇迹之沙", "sand"},
    {"奇迹之杯", "cup"},
    {"奇迹耳坠", "head"},
    config4 = {}
  },
  --5 star--
  {
    eng = "archaicPetra",
    chs = "悠古的磐岩",
    name2 = "ArchaicPetra",
    minStar = 4,
    maxStar = 5,
    effect2 = "获得15%岩元素伤害加成。",
    effect4 = "获得结晶反应形成的晶片时，队伍中所有角色获得35%对应元素伤害加成，持续10秒。同时只能通过该效果获得一种元素伤害加成。",
    {"磐陀裂生之花", "flower"},
    {"嵯峨群峰之翼", "feather"},
    {"星罗圭壁之晷", "sand"},
    {"巉岩琢塑之樽", "cup"},
    {"不动玄石之相", "head"},
    config4 = {
      {["default"] = "Electro", ["name"] = "element", ["title"] = "元素", ["type"] = "element4"},
      {["default"] = 0.0, ["max"] = 1.0, ["min"] = 0.0, ["name"] = "rate", ["title"] = "应用比例", ["type"] = "float"}
    }
  },
  {
    "blizzardStrayer",
    chs = "冰风迷途的勇士",
    name2 = "BlizzardStrayer",
    minStar = 4,
    maxStar = 5,
    effect2 = "获得15%冰元素伤害加成",
    effect4 = "攻击处于冰元素影响状态下的敌人时，暴击率提高20%；若敌人处于冰冻状态下，暴击率额外提高20%。",
    {"历经风雪的思念", "flower"},
    {"摧冰而行的执望", "feather"},
    {"冰雪故园的终期", "sand"},
    {"遍结寒霜的傲骨", "cup"},
    {"破冰踏雪的回音", "head"},
    config4 = {
      {
        ["default"] = 0.0,
        ["max"] = 0.4,
        ["min"] = 0.0,
        ["name"] = "critical_bonus",
        ["title"] = "等效暴击率",
        ["type"] = "float"
      }
    }
  },
  {
    eng = "bloodstainedChivalry",
    chs = "染血的骑士道",
    name2 = "BloodstainedChivalry",
    minStar = 4,
    maxStar = 5,
    effect2 = "造成的物理伤害提高25%。",
    effect4 = "击败敌人后的10秒内，施放重击时不消耗体力，且造成的伤害提升50%。",
    {"染血的铁之心", "flower"},
    {"染血的黑之羽", "feather"},
    {"骑士染血之时", "sand"},
    {"染血骑士之杯", "cup"},
    {"染血的铁假面", "head"},
    config4 = {
      {["default"] = 0.0, ["max"] = 1.0, ["min"] = 0.0, ["name"] = "rate", ["title"] = "效果应用比例", ["type"] = "float"}
    }
  },
  {
    eng = "crimsonWitch",
    chs = "炽烈的炎之魔女",
    name2 = "CrimsonWitchOfFlames",
    minStar = 4,
    maxStar = 5,
    effect2 = "获得15%火元素伤害加成。",
    effect4 = "超载、燃烧反应造成的伤害提升40%，蒸发、融化反应的加成系数提高15%。施放元素战技后的10秒内，二件套的效果提高50%，该效果最多叠加3次。",
    {"魔女的炎之花", "flower"},
    {"魔女常燃之羽", "feather"},
    {"魔女破灭之时", "sand"},
    {"魔女的心之火", "cup"},
    {"焦灼的魔女帽", "head"},
    config4 = {
      {["default"] = 0.0, ["max"] = 3.0, ["min"] = 0.0, ["name"] = "level", ["title"] = "效果等效层数", ["type"] = "float"}
    }
  },
  {
    eng = "defenderWill",
    chs = "守护之心",
    name2 = "DefendersWill",
    minStar = 0,
    maxStar = 0,
    effect2 = "防御力提高30%。",
    effect4 = "队伍里每有不同一种元素类型的自己的角色，自身获得30%相应的元素抗性。",
    {"守护之花", "flower"},
    {"守护徽印", "feather"},
    {"守护座钟", "sand"},
    {"守护之皿", "cup"},
    {"守护束带", "head"},
    config4 = {}
  },
  {
    eng = "EchoesOfAnOffering",
    chs = "来歆余响",
    name2 = "EchoesOfAnOffering",
    minStar = 4,
    maxStar = 5,
    effect2 = "攻击力提高18%。",
    effect4 = "普通攻击命中敌人时，有36%概率触发「幽谷祝祀」：普通攻击造成的伤害提高，伤害提高值为攻击力的70%，该效果将在普通攻击造成伤害后的0.05秒后清除。普通攻击未触发「幽谷祝祀」时，会使下次触发概率提升20%；0.2秒内至多判定1次触发与否。（注：平均触发比例为50.53%）",
    {"魂香之花", "flower"},
    {"垂玉之叶", "feather"},
    {"祝祀之凭", "sand"},
    {"涌泉之盏", "cup"},
    {"浮溯之珏", "head"},
    config4 = {
      {
        ["default"] = 0.5053283764473575,
        ["max"] = 1.0,
        ["min"] = 0.0,
        ["name"] = "rate",
        ["title"] = "平均触发比例",
        ["type"] = "float"
      }
    }
  },
  {
    eng = "emblemOfSeveredFate",
    chs = "绝缘之旗印",
    name2 = "EmblemOfSeveredFate",
    minStar = 4,
    maxStar = 5,
    effect2 = "元素充能效率提高20%。",
    effect4 = "基于元素充能效率的25%，提高元素爆发造成的伤害。至多通过这种方式获得75%提升。",
    {"明威之镡", "flower"},
    {"切落之羽", "feather"},
    {"雷云之笼", "sand"},
    {"绯花之壶", "cup"},
    {"华饰之兜", "head"},
    config4 = {}
  },
  {
    eng = "gladiatorFinale",
    chs = "角斗士的终幕礼",
    name2 = "GladiatorsFinale",
    minStar = 4,
    maxStar = 5,
    effect2 = "攻击力提高18%。",
    effect4 = "装备该圣遗物套装的角色为单手剑、双手剑、长柄武器角色时，角色普通攻击造成的伤害提高35%。",
    {"角斗士的留恋", "flower"},
    {"角斗士的归宿", "feather"},
    {"角斗士的希冀", "sand"},
    {"角斗士的酣醉", "cup"},
    {"角斗士的凯旋", "head"},
    config4 = {}
  },
  {
    eng = "heartOfDepth",
    chs = "沉沦之心",
    name2 = "HeartOfDepth",
    minStar = 4,
    maxStar = 5,
    effect2 = "获得15%水元素伤害加成。",
    effect4 = "施放元素战技后的15秒内，普通攻击与重击造成的伤害提高30%。",
    {"饰金胸花", "flower"},
    {"追忆之风", "feather"},
    {"坚铜罗盘", "sand"},
    {"沉波之盏", "cup"},
    {"酒渍船帽", "head"},
    config4 = {
      {["default"] = 0.0, ["max"] = 1.0, ["min"] = 0.0, ["name"] = "rate", ["title"] = "效果应用比例", ["type"] = "float"}
    }
  },
  {
    eng = "huskOfOpulentDreams",
    chs = "华馆梦醒形骸记",
    name2 = "HuskOfOpulentDreams",
    minStar = 4,
    maxStar = 5,
    effect2 = "防御力提高30%。",
    effect4 = "装备此圣遗物套装的角色在以下情况下，将获得「问答」效果：在场上用岩元素攻击命中敌人后获得一层，每0.3秒至多触发一次；在队伍后台中，每3秒获得一层。问答至多叠加4层，每层能提供6%防御力与6%岩元素伤害加成。每6秒，若未获得问答效果，将损失一层。",
    {"荣花之期", "flower"},
    {"华馆之羽", "feather"},
    {"众生之谣", "sand"},
    {"梦醒之瓢", "cup"},
    {"形骸之笠", "head"},
    config4 = {
      {
        ["default"] = 0.0,
        ["max"] = 4.0,
        ["min"] = 0.0,
        ["name"] = "level",
        ["title"] = "「问答」效果等效层数",
        ["type"] = "float"
      }
    }
  },
  {
    eng = "lavaWalker",
    chs = "渡过烈火的贤人",
    name2 = "Lavawalker",
    minStar = 4,
    maxStar = 5,
    effect2 = "火元素抗性提高40%。",
    effect4 = "对处于火元素影响下的敌人造成的伤害提升35%。",
    {"渡火者的决绝", "flower"},
    {"渡火者的解脱", "feather"},
    {"渡火者的煎熬", "sand"},
    {"渡火者的醒悟", "cup"},
    {"渡火者的智慧", "head"},
    config4 = {
      {["default"] = 0.0, ["max"] = 1.0, ["min"] = 0.0, ["name"] = "rate", ["title"] = "敌人火元素覆盖率", ["type"] = "float"}
    }
  },
  {
    eng = "maidenBeloved",
    chs = "被怜爱的少女",
    name2 = "MaidenBeloved",
    minStar = 4,
    maxStar = 5,
    effect2 = "角色造成的治疗效果提升15%",
    effect4 = "施放元素战技或元素爆发后的10秒内，队伍中所有角色受治疗效果加成提高20%。",
    {"远方的少女的心", "flower"},
    {"少女飘摇的思念", "feather"},
    {"少女苦短的良辰", "sand"},
    {"少女片刻的闲暇", "cup"},
    {"少女易逝的芳颜", "head"},
    config4 = {}
  },
  {
    eng = "noblesseOblige",
    chs = "昔日宗室之仪",
    name2 = "NoblesseOblige",
    minStar = 4,
    maxStar = 5,
    effect2 = "元素爆发造成的伤害提升20％。",
    effect4 = "施放元素爆发后，队伍中所有角色攻击力提升20％，持续12秒。该效果不可叠加。",
    {"宗室之花", "flower"},
    {"宗室之翎", "feather"},
    {"宗室时计", "sand"},
    {"宗室银瓮", "cup"},
    {"宗室面具", "head"},
    config4 = {
      {["default"] = 0.0, ["max"] = 1.0, ["min"] = 0.0, ["name"] = "rate", ["title"] = "效果应用比例", ["type"] = "float"}
    }
  },
  {
    eng = "oceanHuedClam",
    chs = "海染砗磲",
    name2 = "OceanHuedClam",
    minStar = 4,
    maxStar = 5,
    effect2 = "治疗加成提高15%。",
    effect4 = "装备此圣遗物套装的角色对队伍中的角色进行治疗时，将产生持续3秒的海染泡沫，记录治疗的生命值回复量（包括溢出值）。持续时间结束时，海染泡沫将会爆炸，对周围的敌人造成90%累计回复量的伤害（该伤害结算方式同感电、超导等元素反应，但不受元素精通、等级或反应伤害加成效果影响）。每3.5秒至多产生一个海染泡沫；海染泡沫至多记录30000点回复量，含溢出部分的治疗量；自己的队伍中同时至多存在一个海染泡沫。装备此圣遗物套装的角色处于队伍后台时，依然能触发该效果。",
    {"海染之花", "flower"},
    {"渊宫之羽", "feather"},
    {"离别之贝", "sand"},
    {"真珠之笼", "cup"},
    {"海祇之冠", "head"},
    config4 = {}
  },
  {
    eng = "paleFlame",
    chs = "苍白之火",
    name2 = "PaleFlame",
    minStar = 4,
    maxStar = 5,
    effect2 = "造成的物理伤害提高25%。",
    effect4 = "元素战技命中敌人后，①攻击力提升9%。该效果持续7秒，至多叠加2层，每0.3秒至多触发一次。叠满2层时，②2件套的效果提升100%。",
    {"无垢之花", "flower"},
    {"贤医之羽", "feather"},
    {"停摆之刻", "sand"},
    {"超越之盏", "cup"},
    {"嗤笑之面", "head"},
    config4 = {
      {
        ["default"] = 0.0,
        ["max"] = 2.0,
        ["min"] = 0.0,
        ["name"] = "avg_level",
        ["title"] = "效果①等效层数",
        ["type"] = "float"
      },
      {
        ["default"] = 0.0,
        ["max"] = 1.0,
        ["min"] = 0.0,
        ["name"] = "full_rate",
        ["title"] = "满层效果比例",
        ["type"] = "float"
      }
    }
  },
  {
    eng = "retracingBolide",
    chs = "逆飞的流星",
    name2 = "RetracingBolide",
    minStar = 4,
    maxStar = 5,
    effect2 = "护盾强效提高35%",
    effect4 = "处于护盾庇护下时，额外获得40%普通攻击和重击伤害加成。",
    {"夏祭之花", "flower"},
    {"夏祭终末", "feather"},
    {"夏祭之刻", "sand"},
    {"夏祭水玉", "cup"},
    {"夏祭之面", "head"},
    config4 = {
      {["default"] = 0.0, ["max"] = 1.0, ["min"] = 0.0, ["name"] = "rate", ["title"] = "护盾覆盖率", ["type"] = "float"}
    }
  },
  {
    eng = "shimenawaReminiscence",
    chs = "追忆之注连",
    name2 = "ShimenawasReminiscence",
    minStar = 4,
    maxStar = 5,
    effect2 = "攻击力提高18%。",
    effect4 = "施放元素战技时，如果角色的元素能量高于或等于15点，则会流失15点元素能量，使接下来的10秒内，普通攻击、重击、下落攻击造成的伤害提高50%。",
    {"羁缠之花", "flower"},
    {"思忆之矢", "feather"},
    {"朝露之时", "sand"},
    {"祈望之心", "cup"},
    {"无常之面", "head"},
    config4 = {
      {["default"] = 0.0, ["max"] = 1.0, ["min"] = 0.0, ["name"] = "rate", ["title"] = "效果应用比例", ["type"] = "float"}
    }
  },
  {
    eng = "tenacityOfTheMillelith",
    chs = "千岩牢固",
    name2 = "TenacityOfTheMillelith",
    minStar = 4,
    maxStar = 5,
    effect2 = "生命值提升20%",
    effect4 = "元素战技命中敌人后，使队伍中附近的所有角色攻击力提升20%，护盾强效提升30%，持续3秒。该效果每0.5秒至多触发一次。装备此圣遗物套装效果的角色处于队伍后台时，依然能触发该效果。",
    {"勋绩之花", "flower"},
    {"昭武翎羽", "feather"},
    {"金铜时晷", "sand"},
    {"盟誓金爵", "cup"},
    {"将帅兜鍪", "head"},
    config4 = {
      {["default"] = 0.0, ["max"] = 1.0, ["min"] = 0.0, ["name"] = "rate", ["title"] = "效果应用比例", ["type"] = "float"}
    }
  },
  {
    eng = "thunderingFury",
    chs = "如雷的盛怒",
    name2 = "ThunderingFury",
    minStar = 4,
    maxStar = 5,
    effect2 = "获得15%雷元素伤害加成。",
    effect4 = "超载、感电、超导反应造成的伤害提升40%。触发这些元素反应时，元素战技冷却时间减少1秒。该效果每0.8秒最多触发一次。",
    {"雷鸟的怜悯", "flower"},
    {"雷灾的孑遗", "feather"},
    {"雷霆的时计", "sand"},
    {"降雷的凶兆", "cup"},
    {"唤雷的头冠", "head"},
    config4 = {}
  },
  {
    eng = "thunderSmoother",
    chs = "平息鸣雷的尊者",
    name2 = "Thundersoother",
    minStar = 4,
    maxStar = 5,
    effect2 = "雷元素抗性提高40%。",
    effect4 = "对处于雷元素影响下的敌人造成的伤害提升35%。",
    {"平雷之心", "flower"},
    {"平雷之羽", "feather"},
    {"平雷之刻", "sand"},
    {"平雷之器", "cup"},
    {"平雷之冠", "head"},
    config4 = {
      {["default"] = 0.0, ["max"] = 1.0, ["min"] = 0.0, ["name"] = "rate", ["title"] = "敌方雷元素覆盖率", ["type"] = "float"}
    }
  },
  {
    eng = "VermillionHereafter",
    chs = "辰砂往生录",
    name2 = "VermillionHereafter",
    minStar = 4,
    maxStar = 5,
    effect2 = "攻击力提高18%。",
    effect4 = "施放元素爆发后，将产生持续16秒的「潜光」效果：攻击力提升8%；并在角色的生命值降低时，攻击力进一步提升10%，至多通过这种方式提升4次，每0.8秒至多触发一次。「潜光」效果将在角色退场时消失；持续期间再次施放元素爆发，将移除原有的「潜光」。",
    {"生灵之华", "flower"},
    {"潜光片羽", "feather"},
    {"阳辔之遗", "sand"},
    {"结契之刻", "cup"},
    {"虺雷之姿", "head"},
    config4 = {
      {["default"] = 0.0, ["max"] = 1.0, ["min"] = 0.0, ["name"] = "rate_q", ["title"] = "元素爆发频率", ["type"] = "float"},
      {["default"] = 0.0, ["max"] = 4.0, ["min"] = 0.0, ["name"] = "stack", ["title"] = "平均层数", ["type"] = "float"}
    }
  },
  {
    eng = "viridescentVenerer",
    chs = "翠绿之影",
    name2 = "ViridescentVenerer",
    minStar = 4,
    maxStar = 5,
    effect2 = "获得15%风元素伤害加成。",
    effect4 = "扩散反应造成的伤害提升60%，根据扩散的元素类型，降低受到影响的敌人40%的对应元素抗性，持续10秒。",
    {"野花记忆的绿野", "flower"},
    {"猎人青翠的箭羽", "feather"},
    {"翠绿猎人的笃定", "sand"},
    {"翠绿猎人的容器", "cup"},
    {"翠绿的猎人之冠", "head"},
    config4 = {}
  },
  {
    eng = "wandererTroupe",
    chs = "流浪大地的乐团",
    name2 = "WanderersTroupe",
    minStar = 4,
    maxStar = 5,
    effect2 = "元素精通提高80点。",
    effect4 = "装备该圣遗物套装的角色为法器、弓箭角色时，角色重击造成的伤害提高35%。",
    {"乐团的晨光", "flower"},
    {"琴师的箭羽", "feather"},
    {"终幕的时计", "sand"},
    {"吟游者之壶", "cup"},
    {"指挥的礼帽", "head"},
    config4 = {}
  },
  {
    eng="DeepwoodMemories",
    chs="深林的记忆",
    name2="DeepwoodMemories",
    minStar=4,
    maxStar=5,
    effect2="获得15%草元素伤害加成。",
    effect4="元素战技或元素爆发命中敌人后，使命中目标的草元素抗性降低30%，持续8秒。装备者处于队伍后台时，依然能触发该效果。",
    {"迷宫的游人","flower"},
    {"翠蔓的智者","feather"},
    {"贤智的定期","sand"},
    {"迷误者之灯","cup"},
    {"月桂的宝冠","head"},
    config4={
      {"default":0.0,"max":1.0,"min":0.0,"name":"rate","title":"a2","type":"float"},
    }
  },
  {
    eng="GildedDreams",
    chs="饰金之梦",
    name2="GildedDreams",
    minStar=4,
    maxStar=5,
    effect2="元素精通提高80点。",
    effect4="触发元素反应后的8秒内，会根据队伍内其他角色的元素类型，使装备者获得强化：队伍中每存在1个和装备者同类元素的角色，攻击力提升14%；每存在1个和装备者不同元素类型的角色，元素精通提升50点。上述每类效果至多计算3个角色。该效果每8秒至多触发一次。装备者处于队伍后台时，依然能触发该效果。",
    {"梦中的铁花","flower"},
    {"裁断的翎羽","feather"},
    {"沉金的岁月","sand"},
    {"如蜜的终宴","cup"},
    {"沙王的投影","head"},
    config4={
      {"default":0,"max":3,"min":0,"name":"same_count","title":"a14","type":"int"},
      {"default":0,"max":3,"min":0,"name":"diff_count","title":"a15","type":"int"},
      {"default":0.0,"max":1.0,"min":0.0,"name":"rate","title":"a2","type":"float"},
    }
  },
}
