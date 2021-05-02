class ThemeFactory {
    
    static let shared = ThemeFactory()
    var themes: [Theme]!
    
    init() {
        createThemes()
    }
    
    func createThemes() {
        var themes = [Theme]()

        var emojis = ["🦒", "🐪", "🦏", "🐘", "🦍", "🦓", "🐆"]
        let savana = Theme(name: "Savana",
                           emojis: emojis,
                           numberOfCards: emojis.count,
                           colors: [.orange, .gray])
        themes.append(savana)

        emojis = ["🎷", "🥁", "🪕", "🎻", "🎺"]
        let farm = Theme(name: "Music",
                         emojis: emojis,
                         numberOfCards: emojis.count,
                         colors: [.red])
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
        
        self.themes = themes
    }
    
    func randomTheme() -> Theme {
        return themes.randomElement()!
    }
}
