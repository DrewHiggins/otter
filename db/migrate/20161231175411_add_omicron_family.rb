class AddOmicronFamily < ActiveRecord::Migration
  def up
    # create the family
    omicron_fam = Family.find_or_create_by(name: 'Omicron')
    # create the founding father
    Brother.create(first_name: 'Jennifer', last_name: 'Kane', status: 'Alumni', family: omicron_fam)
    # add or find necessary rush classes
    spring1993 = RushClass.find_or_create_by(greek_name: 'Gamma', year: 1993, semester: 'Spring')
    fall1993 = RushClass.find_or_create_by(greek_name: 'Delta', year: 1993, semester: 'Fall')
    spring1995 = RushClass.find_or_create_by(greek_name: 'Eta', year: 1995, semester: 'Spring')
    fall1995 = RushClass.find_or_create_by(greek_name: 'Theta', year: 1995, semester: 'Fall')
    fall1996 = RushClass.find_or_create_by(greek_name: 'Kappa', year: 1996, semester: 'Fall')
    fall1997 = RushClass.find_or_create_by(greek_name: 'Mu', year: 1997, semester: 'Fall')
    spring1998 = RushClass.find_or_create_by(greek_name: 'Nu', year: 1998, semester: 'Spring')
    fall1998 = RushClass.find_or_create_by(greek_name: 'Xi', year: 1998, semester: 'Fall')
    spring1999 = RushClass.find_or_create_by(greek_name: 'Omicron', year: 1999, semester: 'Spring')
    fall1999 = RushClass.find_or_create_by(greek_name: 'Pi', year: 1999, semester: 'Fall')
    spring2000 = RushClass.find_or_create_by(greek_name: 'Rho', year: 2000, semester: 'Fall')
    fall2000 = RushClass.find_or_create_by(greek_name: 'Sigma', year: 2000, semester: 'Fall')
    spring2001 = RushClass.find_or_create_by(greek_name: 'Tau', year: 2001, semester: 'Spring')
    fall2001 = RushClass.find_or_create_by(greek_name: 'Upsilon', year: 2001, semester: 'Fall')
    spring2002 = RushClass.find_or_create_by(greek_name: 'Phi', year: 2002, semester: 'Spring')
    spring2003 = RushClass.find_or_create_by(greek_name: 'Psi', year: 2003, semester: 'Spring')
    fall2003 = RushClass.find_or_create_by(greek_name: 'Omega', year: 2003, semester: 'Fall')
    spring2004 = RushClass.find_or_create_by(greek_name: 'Alpha Alpha', year: 2004, semester: 'Spring')
    fall2004 = RushClass.find_or_create_by(greek_name: 'Alpha Beta', year: 2004, semester: 'Fall')
    spring2005 = RushClass.find_or_create_by(greek_name: 'Alpha Gamma', year: 2005, semester: 'Spring')
    fall2005 = RushClass.find_or_create_by(greek_name: 'Alpha Delta', year: 2005, semester: 'Fall')
    spring2006 = RushClass.find_or_create_by(greek_name: 'Alpha Epsilon', year: 2006, semester: 'Spring')
    spring2007 = RushClass.find_or_create_by(greek_name: 'Alpha Eta', year: 2007, semester: 'Spring')
    spring2008 = RushClass.find_or_create_by(greek_name: 'Alpha Iota', year: 2008, semester: 'Spring')
    spring2009 = RushClass.find_or_create_by(greek_name: 'Alpha Lambda', year: 2009, semester: 'Spring')
    fall2009 = RushClass.find_or_create_by(greek_name: 'Alpha Mu', year: 2009, semester: 'Fall')
    spring2010 = RushClass.find_or_create_by(greek_name: 'Alpha Nu', year: 2010, semester: 'Spring')
    spring2011 = RushClass.find_or_create_by(greek_name: 'Alpha Omicron', year: 2011, semester: 'Spring')
    spring2012 = RushClass.find_or_create_by(greek_name: 'Alpha Rho', year: 2012, semester: 'Spring')
    spring2013 = RushClass.find_or_create_by(greek_name: 'Alpha Tau', year: 2013, semester: 'Spring')
    fall2013 = RushClass.find_or_create_by(greek_name: 'Alpha Upsilon', year: 2013, semester: 'Fall')
    fall2014 = RushClass.find_or_create_by(greek_name: 'Alpha Chi', year: 2014, semester: 'Fall')
    spring2015 = RushClass.find_or_create_by(greek_name: 'Alpha Psi', year: 2015, semester: 'Spring')
    fall2015 = RushClass.find_or_create_by(greek_name: 'Alpha Omega', year: 2015, semester: 'Fall')
    fall2016 = RushClass.find_or_create_by(greek_name: 'Beta Beta', year: 2016, semester: 'Fall')

    # make an array of the data for the other brothers in the family to loop through and add
    omicron_bros = [
      { name: 'Beth Hannon', status: 'Alumni', rush_class: spring1993, big: 'Jennifer Kane' },
      { name: 'Joy Larson', status: 'Alumni', rush_class: fall1995, big: 'Beth Hannon' },
      { name: 'Nora Catlin', status: 'Alumni', rush_class: spring1995, big: 'Beth Hannon' },
      { name: 'Charlie Hitscherich', status: 'Transferred', rush_class: fall1995, big: 'Beth Hannon' },
      { name: 'Jeremy Noll', status: 'Alumni', rush_class: fall1995, big: 'Nora Catlin' },
      { name: 'Rob Petch', status: 'Alumni', rush_class: fall1996, big: 'Charlie Hitscherich' },
      { name: 'Lori Bruenderman', status: 'Alumni', rush_class: fall1996, big: 'Jeremy Noll' },
      { name: 'Justin Edgar', status: 'Expelled', rush_class: spring1998, big: 'Rob Petch' },
      { name: 'Nicole Cornelius', status: 'Alumni', rush_class: fall1997, big: 'Lori Bruenderman' },
      { name: 'Andrea Hartshorn', status: 'Alumni', rush_class: fall1998, big: 'Justin Edgar' },
      { name: 'Brandi Groove', status: 'Alumni', rush_class: spring1999, big: 'Andrea Hartshorn' },
      { name: 'Kevin Zalanowski', status: 'Alumni', rush_class: fall1999, big: 'Andrea Hartshorn' },
      { name: 'Laura Clark', status: 'Alumni', rush_class: fall1999, big: 'Brandi Groove' },
      { name: 'Kristen Lewis', status: 'Alumni', rush_class: spring2000, big: 'Kevin Zalanowski' },
      { name: 'Amanda Miller', status: 'Alumni', rush_class: spring2001, big: 'Kevin Zalanowski' },
      { name: 'Amy Behel', status: 'Alumni', rush_class: spring2000, big: 'Laura Clark' },
      { name: 'Michelle Dean', status: 'Alumni', rush_class: fall2000, big: 'Kristen Lewis' },
      { name: 'Meredith Ferguson', status: 'Alumni', rush_class: spring2001, big: 'Kristen Lewis' },
      { name: 'Caitlin Ferrell', status: 'Alumni', rush_class: spring2002, big: 'Amanda Miller' },
      { name: 'Stefanie Klevze', status: 'Alumni', rush_class: spring2001, big: 'Amy Behel' },
      { name: 'Beth Mussey', status: 'Alumni', rush_class: spring2001, big: 'Michelle Dean' },
      { name: 'Carolyn Wassong', status: 'Alumni', rush_class: spring2002, big: 'Meredith Ferguson' },
      { name: 'Nancy Law', status: 'Alumni', rush_class: spring2003, big: 'Caitlin Ferrell' },
      { name: 'Sarah Kline', status: 'Alumni', rush_class: spring2004, big: 'Caitlin Ferrell'},
      { name: 'Jessica Ruehr', status: 'Alumni', rush_class: fall2001, big: 'Stefanie Klevze' },
      { name: 'Alexis Atkins', status: 'Alumni', rush_class: fall2003, big: 'Stefanie Klevze' },
      { name: 'Dale Korman', status: 'Alumni', rush_class: fall2003, big: 'Nancy Law' },
      { name: 'Emily Marks', status: 'Alumni', rush_class: fall2004, big: 'Sarah Kline' },
      { name: 'Adam Shettler', status: 'Alumni', rush_class: spring2005, big: 'Sarah Kline' },
      { name: 'Donavan Hunt', stauts: 'Alumni', rush_class: spring2006, big: 'Sarah Kline' },
      { name: 'Michelle Kelly', status: 'Alumni', rush_class: spring2004, big: 'Alexis Atkins' },
      { name: 'Kelly Lesny', status: 'Alumni', rush_class: spring2004, big: 'Dale Korman' },
      { name: 'Jarie Clouse', status: 'Alumni', rush_class: fall2004, big: 'Dale Korman' },
      { name: 'Craig Plante', status: 'Alumni', rush_class: spring2005, big: 'Emily Marks' },
      { name: 'Bridget Monaghan', status: 'Alumni', rush_class: spring2006, big: 'Emily Marks' },
      { name: 'Kim Kozak', status: 'Alumni', rush_class: spring2005, big: 'Michelle Kelly' },
      { name: 'Joe Apatov', status: 'Expelled', rush_class: spring2005, big: 'Kelly Lesny' },
      { name: 'Brittany Ditto', status: 'Alumni', rush_class: fall2005, big: 'Jarie Clouse' },
      { name: 'Kelly Russo', status: 'Alumni', rush_class: spring2007, big: 'Bridget Monaghan' },
      { name: 'Kate Matheson', status: 'Alumni', rush_class: spring2006, big: 'Kim Kozak'},
      { name: 'Matthew Piccione', status: 'Alumni', rush_class: fall2005, big: 'Joe Apatov' },
      { name: 'Zac Pawlikowski', status: 'Alumni', rush_class: spring2007, big: 'Brittany Ditto' },
      { name: 'Caitlin Lozorak', status: 'Alumni', rush_class: spring2008, big: 'Kelly Russo' },
      { name: 'Katie Tice', status: 'Alumni', rush_class: spring2007, big: 'Kate Matheson' },
      { name: 'Meghan Marley', status: 'Alumni', rush_class: spring2009, big: 'Kate Matheson' },
      { name: 'Jony Rommel', status: 'Alumni', rush_class: spring2009, big: 'Kate Matheson' },
      { name: 'Tristen Helms', status: 'Expelled', rush_class: spring2006, big: 'Matthew Piccione' },
      { name: 'Brandon Drummond', status: 'Alumni', rush_class: spring2008, big: 'Zac Pawlikowski' },
      { name: 'Amber Nowicki', status: 'Expelled', rush_class: spring2009, big: 'Caitlin Lozorak' },
      { name: 'Amanda Fellmeth', status: 'Alumni', rush_class: spring2008, big: 'Katie Tice' },
      { name: 'Janee Smith', status: 'Alumni', rush_class: spring2009, big: 'Jony Rommel' },
      { name: 'Kyle Rice', status: 'Alumni', rush_class: spring2009, big: 'Brandon Drummond' },
      { name: 'Anna Brita', status: 'Alumni', rush_class: spring2009, big: 'Amanda Fellmeth' },
      { name: 'Colleen Boyle', status: 'Alumni', rush_class: spring2010, big: 'Amanda Fellmeth' },
      { name: 'Dom Massaro', status: 'Alumni', rush_class: spring2010, big: 'Kyle Rice' },
      { name: 'Jordan Derk', status: 'Expelled', rush_class: fall2009, big: 'Anna Brita' },
      { name: 'Sarah Olah', status: 'Alumni', rush_class: spring2011, big: 'Colleen Boyle' },
      { name: 'Mikayla Borusiewicz', status: 'Alumni', rush_class: spring2012, big: 'Colleen Boyle' },
      { name: 'Julie Bascanskas', status: 'Alumni', rush_class: spring2012, big: 'Sarah Olah' },
      { name: 'Kelsey Reynolds', status: 'Alumni', rush_class: fall2013, big: 'Mikayla Borusiewicz' },
      { name: 'Cara Dore', status: 'Active', rush_class: fall2014, big: 'Mikayla Borusiewicz' },
      { name: 'Kelsey Ohlbaum', status: 'Alumni', rush_class: spring2013, big: 'Julie Bascanskas' },
      { name: 'Selina Vinski', status: 'Alumni', rush_class: fall2014, big: 'Julie Bascanskas' },
      { name: 'Kendra Hepler', status: 'Active', rush_class: fall2014, big: 'Kelsey Reynolds' },
      { name: 'Martha Schupp', status: 'Active', rush_class: spring2015, big: 'Cara Dore' },
      { name: 'Erica Reeves', status: 'Expelled', rush_class: spring2015, big: 'Kelsey Ohlbaum' },
      { name: 'Aracelis Velez', status: 'Active', rush_class: fall2015, big: 'Kendra Hepler' },
      { name: 'Gretchen Riker', status: 'Active', rush_class: fall2016, big: 'Martha Schupp'},
      { name: 'Akriti Sharma', status: 'Active', rush_class: fall2016, big: 'Martha Schupp' }
    ]
    # loop through and add bros
    omicron_bros.each do |bro_data|
      name = bro_data[:name].split(" ")
      fname = name[0]
      lname = name[1]
      big_name = bro_data[:big].split(" ")
      big_fname = big_name[0]
      big_lname = big_name[1]
      big = Brother.find_by(first_name: big_fname, last_name: big_lname)
      Brother.create(first_name: fname, last_name: lname, status: bro_data[:status], rush_class: bro_data[:rush_class], parent: big, family: omicron_fam)
    end
  end

  def down
    @omicron = Family.find_by(name: 'Omicron')
    unless @omicron.nil?
      Brother.where(family_id: @omicron.id).each do |brother|
        brother.destroy
      end
      @omicron.destroy
    end
  end
end
