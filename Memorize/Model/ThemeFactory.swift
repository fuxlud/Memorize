struct ThemeFactory {
    static func createThemes() -> [Theme] {
        var themes = [Theme]()

        var emojis = ["🦒", "🐪", "🦏", "🐘", "🦍", "🦓", "🐆"]
        let savana = Theme(name: "Savana",
                           emojis: emojis,
                           numberOfCards: emojis.count,
                           colors: [.orange, .gray])
        themes.append(savana)

        emojis = ["🐖", "🐐", "🐏", "🐓", "🐄", "🦃"]
        let farm = Theme(name: "Farm",
                         emojis: emojis,
                         numberOfCards: emojis.count,
                         colors: [.yellow])
        themes.append(farm)

        emojis = ["🌲", "🌳", "🌴", "🌵", "🎋"]
        let trees = Theme(name: "Trees",
                          emojis: emojis,
                          numberOfCards: emojis.count,
                          colors: [.green])
        themes.append(trees)

        emojis = ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇"]
        let fruit = Theme(name: "Fruit",
                          emojis: emojis,
                          numberOfCards: nil,
                          colors: [.red, .orange, .purple])
        themes.append(fruit)

        emojis = ["🛵", "🚑", "🚙", "🚂", "🚲", "🚀", "🚄"]
        let transportation = Theme(name: "Transportation",
                                   emojis: emojis,
                                   numberOfCards: nil,
                                   colors: [.blue, .gray, .black])
        themes.append(transportation)
        
        return themes
    }
}
