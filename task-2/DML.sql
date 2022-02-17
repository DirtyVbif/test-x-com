-- -----------------------------------------------------------
-- 1. выбор товаров одного типа (подраздел каталога)
SELECT g.`gid`, g.`artid`, g.`label`, g.`preview`, g.`description`, t.`tid`, t.`label` as `type`
    FROM `types` t
    LEFT JOIN `goods_types` USING(`tid`)
    LEFT JOIN `goods` g USING(`gid`)
    WHERE t.`tid` = 3;

-- -----------------------------------------------------------
-- 2. выбор всех типов товаров одного раздела каталога
SELECT
    g.`gid`, g.`artid`, g.`label`, g.`preview`, g.`description`,
    t.`tid`, t.`label` as `type`,
    s.`sid`, s.`label` as `section`
    FROM `sections` s
    LEFT JOIN `sections_types` USING(`sid`)
    LEFT JOIN `types` t USING(`tid`)
    LEFT JOIN `goods_types` USING(`tid`)
    LEFT JOIN `goods` g USING(`gid`)
    WHERE s.`sid` = 5;