Layers = Framer.Importer.load "imported/application-design"

###
Configure default visiblity of Layers.
###

Layers.Header.visible = true
Layers.Feed.visible = true
Layers.Menu.visible = true
Layers.Favourites.visible = false
Layers.Preview.visible = true
Layers.Settings.visible = false

###
Clip container height of Feed to enable scrolling
###
Layers.Feed.height = 1200
Layers.Feed.y = 130
Layers.Feed.clip = true
Layers.Feed.scrollVertical = true

###
Setup an 'menuOpen' state for the side nav animation.
###

paddingWhenTheMenuIsOpen = 620
Layers.Header.states.add
	menuOpen: { 
			x: paddingWhenTheMenuIsOpen
	}
	
Layers.Feed.states.add
	menuOpen: { 
			x: paddingWhenTheMenuIsOpen
			height: 1400
	}

Layers.Preview.states.add
	menuOpen: { 
			x: 1000		# hide
	}

###
animate the menu items in when the side nav slides menuOpen.
###
Layers.Menu.x = 400
Layers.Menu.scale = .5
Layers.Menu.states.add
	menuOpen: { 
			x: 0 
		scale: 1
	}


###
Set default animation options for the side
nav animation.
###
Layers.Feed.states.animationOptions =
Layers.Header.states.animationOptions =
Layers.Menu.states.animationOptions =
Layers.Preview.states.animationOptions = 
	curve: 'spring-rk4'
	curveOptions:
		tension: 150
		friction: 20
		velocity: 5

###
When the NavButton layer is tapped:
- animate the side nav menuOpen
- close the side nav when a menuitem is tapped.
###
Layers.HamburgerMenu.on Events.Click, ->
	Layers.Feed.states.switch 'menuOpen'
	Layers.Header.states.switch 'menuOpen'
	Layers.Menu.states.switch 'menuOpen'
	Layers.Preview.states.switch 'menuOpen'
	Layers.Preview.enable = false

Layers.Menu.on Events.Click, ->
	Layers.Feed.states.switch 'default'
	Layers.Header.states.switch 'default'
	Layers.Menu.states.switch 'default'
	Layers.Preview.states.switch 'default'


###

###

Layers.Header.states.add
	previewActive: { 
			x: 1000 # hide
	}

Layers.Feed.states.add
	previewActive: { 
			x: 1000 # hide
	}

Layers.Menu.states.add
	previewActive: { 
			x: 1000	# hide
	}

Layers.Preview.states.add
	previewActive: { 
			x: 0	# show
	}
	
###
When the Feed is tapped:
- animate the photo viewer menuOpen
- close the photo viewer it iswhen tapped
###
Layers.FeedContainer.on Events.Click, ->
	Layers.Feed.states.switch 'previewActive'
	Layers.Header.states.switch 'previewActive'
	Layers.Menu.states.switch 'previewActive'
	Layers.Preview.states.switch 'previewActive'


Layers.PreviewContainer.on Events.Click, ->
	Layers.Feed.states.switch 'default'
	Layers.Header.states.switch 'default'
	Layers.Menu.states.switch 'default'
	Layers.Preview.states.switch 'default'
	
