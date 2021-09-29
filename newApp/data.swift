

struct Meals {
    
    static var pizzaList: [Pizza] = [
        Pizza(type: "Маргарита", overview: "Пицца Маргарита — традиционная итальянская пицца, пожалуй, самая популярная в мире, даже меню любой пиццерии начинается, как правило, именно с неё. Состав этой пиццы необычайно прост, её основные ингредиенты: сыр моцарелла, спелые помидоры и листья свежего базилика, которые придают ей неповторимый вкус и аромат.", ingredients: "Моцарелла, Помидоры, Базилик", smallCost: 99, mediumСost: 210, largeCost: 255, picture: "https://static.1000.menu/img/content-v2/ef/27/10853/picca-margarita-v-domashnix-usloviyax_1608783820_4_max.jpg"),
        Pizza(type: "Баварская", overview: "Отведав Баварскую пиццу, вы на миг перенесетесь в этот мир вкусного пива, аттракционов и баварских сосисок, известных всему миру. Хрустящие маринованные огурчики и лук, горчичный соус и сыр «Моцарелла», и главный компонент – сосиски с сыром, от вкуса которых просто захватывает дух.", ingredients: "Ковбаски баварські, Моцарела, Пармезан, Соус Барбекю", smallCost: 135, mediumСost: 210, largeCost: 255, picture: "https://foodideas.info/sites/default/files/styles/large/public/bavarskaya.jpg?itok=j2qnuJY1"),
        Pizza(type: "Пепперони", overview: "Пицца Пепперони – это довольно популярная разновидность среди всех прочих пицц.В состав пиццы Пепперони входит классический, традиционный набор продуктов, известный в течение десятилетий. Главное – это использование особенной острой колбасы, ведь салями с красным перцем придает остроты.", ingredients: "Моцарела, Пепероні, Соус Альфредо", smallCost: 135, mediumСost: 210, largeCost: 255, picture: "https://roll-club.kh.ua/wp-content/uploads/2014/08/pepperoni.jpg"),
        Pizza(type: "Карбонара", overview: "Пицца «Карбонара» имеет схожее название с пастой, в которой к спагетти добавляется бекон, сыр, сливки и яйцо. Бекон при запекании в сырном соусе пропитывает ароматом всю пиццу. Вам обязательно стоит ее попробовать", ingredients: "Цибуля, Бекон, Шинка, Гриби, Моцарела, Соус Альфредо", smallCost: 166, mediumСost: 235, largeCost: 270, picture: "https://gurmans.dp.ua/giuseppe/7539/picca-karbonara.jpg"),
        Pizza(type: "Гавайская", overview: "Нарядная и яркая, ароматная и сочная – Гавайская пицца воплощает все самое лучшее, чего мы ждем от блюда. Пестрый узор нежной ветчины, упоительно-тягучей моцареллы и солнечных ананасов похож на гавайский пейзаж. ", ingredients: "Курка, Ананас, Моцарела, Соус Альфредо", smallCost: 135, mediumСost: 210, largeCost: 255, picture: "https://www.svoimirykami.club/upload/iblock/75a/75aba29e4c3cff1c7cf59eed7e1573cc.jpg")
    ]
    
    static var burgerList: [Burger] = [
        Burger(type: "Бургер с бифштексом Абердин", overview: "Наш фирменный бургер с бифштексом Абердин всегда подается в черной булочке. Вы не спутаете. Блюдо выходит очень питательным и вполне способно заменить полноценный ланч.", ingredients: "Листья салата, Чеддер, Помидоры, Лук, Пикантные маринованные огурцы, Бифштекс Абердин", cost: 295, picture: "https://myastoriya.com.ua/upload/resize_cache/iblock/144/1200_800_1/144ba954f4fa513114fa7af56e625973.jpg"),
        Burger(type: "Бургер Ковбой", overview: "Аппетитные говяжьи щеки, томленые в собственном соку, были запечены под тонкой полоской красного сыра чеддер и аккуратно уложены на хрустящий листа салата ромен.", ingredients: "Томаты, Маринованные огурчики, Лук, Авторский соус, Салат ромен, Говяжьи щеки ", cost: 330, picture: "https://myastoriya.com.ua/upload/iblock/b78/b78a678bb046961e182a94c36ab66cb9.jpg"),
        Burger(type: "Бургер Bіg Beef Burger", overview: "Утолите даже самый БОЛЬШОЙ голод, купив Bіg Beef Burger. Впечатляющий размерами БОЛЬШОЙ бургер!", ingredients: "Пара безупречных говяжьих бифштексов под двойным сыром Чеддер, свежие, сочные помидоры, огурцы и лук.", cost: 340, picture: "https://myastoriya.com.ua/upload/resize_cache/iblock/d7d/1200_800_1/d7df74bd59c56d0e7cad846a4e2be6c0.jpg"),
        Burger(type: "Бургер Dry aged", overview: "Бургер Dry aged, это аппетитный бифштекс из превосходной выдержанной говядины высшего качества в сочетании с несколькими видами овощей под сыром чеддер. Да, это та самая отборная говядина, достойная подачи в ресторанах. И все это в классической белой булочке. Оптимальный выбор для легкого ланча.", ingredients: "Бифштекс, Чедер, Помидоры, Салат ромен", cost: 295, picture: "https://myastoriya.com.ua/upload/resize_cache/iblock/b1e/1200_800_1/b1e88e97f0e1c8d6f790dd359be8b50a.jpg")]
}
    
    struct Pizza {
        var type: String
        var overview: String
        var ingredients: String
        var smallCost: Int
        var mediumСost:Int
        var largeCost: Int
        var picture: String
    }
    
    struct Burger {
        var type: String
        var overview: String
        var ingredients: String
        var cost: Int
        var picture: String
        
    }

