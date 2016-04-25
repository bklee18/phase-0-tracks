teenage_novel_characters = {
    protagonist: {
        name: "Standard Fiesty Girl, Rebecca",
        love_interests: [
            "Boring Good Guy, Jack",
            "Basic Bad Guy, Logan"
        ],
        special_quirks: [
            "She's good looking like every female main character", 
            "She has a heart of gold, too"
        ]
    },

    supporting_character: {
        name: "Standard Mousy Girl, Jennifer",
        love_interests: [
            "Boring Good Guy's Best Friend, Joe",
            "Basic Bad Guy, Logan"
        ],
        special_quirks: [
            "Possibly Bisexual", 
            "Not as special as Main Character"
        ]
    },

    antagonist: {
        name: "Standard Bad Girl Name, Vanessa",
        love_interests: {
            everyone: [
            "Jack",
            "Logan",
            "Jennifer",
            "Rebecca"
            ]
        }
    }        
}

puts teenage_novel_characters[:protagonist][1]
puts teenage_novel_characters[:supporting_character][:special_quirks][1]
puts teenage_novel_characters[:antagonist][:love_interests][:everyone][3]