#Going to create a nested data structure of NBA teams -> Conference -> Division -> Team -> 2 Players per team

nba = {
  eastern_conference: {
    #divisions
    #Eastern conference only has player names for each team
    atlantic: {
      boston_celtics: ['Jae Crowder', 'Avery Bradley'],
      brooklyn_nets: ['Thaddeus Young', 'Brook Lopez'],
      new_york_knicks: ['Carmelo Anthony', 'Kristaps Porzingus'],
      philadelphia_76ers: ['Nerlens Noel', 'Ish Smith'],
      toronto_raptors: ['Kyle Lowry', 'DeMar DeRozan']
    },
    central: {
      chicago_bulls: ['Jimmy Butler', 'Nikola Mirotic'],
      cleveland_cavaliers: ['Lebron James', 'Kevin Love'],
      detroit_pistons: ['Andre Drummond', 'Reggie Jackson'],
      indiana_pacers: ['Paul George', 'George Hill'],
      milwaukee_bucks: ['Giannis Antetokounmpo', 'Jabari Parker']
    },
    southeast: {
      atlanta_hawks: ['Paul Millsap', 'Al Horford'],
      charlotte_hornets: ['Kemba Walker', 'Nic Batum'],
      miami_heat: ['Dwyane Wade', 'Goran Dragic'],
      orlando_magic: ['Nic Vucevic', 'Victor Hola Depot'],
      washington_wizards: ['John Wall', 'Bradley Beal']
    }
  
  },
  
  
  western_conference: {
    #divisions
    #Western conference has more info for a shortened tag of each team.
    pacific: {
      gsw: {
        full_name: 'Golden State Warriors',
        players: ['Baby Faced Killer', 'Green Machine'],
        rank: 1
      },
      lac: {
        full_name: 'Los Angeles Clippers',
        players: ['CP3', 'Blake Griffin'],
        rank: 6
      },
      lal: {
        full_name: 'Los Angeles Lakers',
        players: ['Bean Bryant', 'Swaggy P'],
        rank: 29
      },
      pho: {
        full_name: 'Phoenix Suns',
        players: ['Eric Bledsoe', 'Devin Booker'],
        rank: 26
      },
      sac: {
        full_name: 'Sacramento Kings',
        players: ['Boogie Cousins', 'Rudy Gay'],
        rank: 21
      }
    },
    southwest: {
      dal: {
        full_name: 'Dallas Mavericks',
        players: ['Do the Dirk', 'Zaza Game 7 Pachulia'],
        rank: 14
      },
      hou: {
        full_name: 'Houston Rockets',
        players: ['James Harden','Dwight Howard'],
        rank: 17
      },
      mem: {
        full_name: 'Memphis Grizzlies',
        players: ['Z-Bo','Big Spain'],
        rank:16
      },
      nop: {
        full_name: 'New Orleans Pelicans',
        players: ['Unibrow','Tyreke Evans'],
        rank: 25
      },
      sas: {
        full_name: 'San Antonio Spurs',
        players: ['Tim beep boop Duncan','The Frenchman'],
        rank: 2
      }
    },
    northwest: {
      den: {
        full_name: 'Denver Nuggets',
        players: ['The Rooster','Will the Thrill'],
        rank: 22
      },
      min: {
        full_name: 'Minnesota Timberwolves',
        players: ['The Big Ticket','Slam Dunk Champ'],
        rank: 26
      },
      okc: {
        full_name: 'Oklahoma City Thunder',
        players: ['The Big Funaki','KD'],
        rank: 5
      },
      pdx: {
        full_name: 'Portland Trailblazers',
        players: ['Droppin Dimes Droppin Dimes','CJ McCollum'],
        rank: 12
      },
      uta: {
        full_name: 'Utah Jazz',
        players: ['Gordon Haywayd','The French Rejection'],
        rank: 19
      }
    }
  }
}

p nba[:western_conference][:pacific][:gsw][:players][1]
p nba[:eastern_conference][:central][:chicago_bulls]
p nba[:western_conference][:northwest][:okc][:rank]
p nba[:western_conference][:southwest][:mem][:players]
p nba[:western_conference][:northwest][:pdx][:full_name]