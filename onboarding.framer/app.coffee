$ = Framer.Importer.load("imported/framerOnboard_12-9@1x")

$.card2.x = 700
$.card2.y = 300

$.card3.x = 1400
$.card3.y = 300

$.placeholder1.opacity = 0
$.placeholder2.opacity = 0


$.card2.scale = 0.85
$.card2.originX = 0
$.card2.originY = 0


$.card3.scale = 0.85
$.card3.originX = 0
$.card3.originY = 0


activeDot = new Layer
	width: 20
	height: 20
	x: 314
	y: 1248
	borderRadius: 20
	backgroundColor: "#6563A4"
	

#Add states
$.card1.states.add
	two: x: -510, y: 300, scale: 0.85, originX: 1, originY: 0
	three: x: -1020, y:300, scale: 0.85, originX: 1, originY: 0
$.card1.states.animationOptions = curve: "spring(200, 20, 0)"

$.card2.states.add
	two: scale: 1, x: 94, y: 268, originX: 0, originY: 0, z: 2
	three:  x: -510, y: 300, scale: 0.85, originX: 1, originY: 0
$.card2.states.animationOptions = curve: "spring(200, 20, 0)"

$.card3.states.add
	two: scale: 0.85, x: 700, y: 300, originX: 0, originY: 0
	three: scale: 1, x: 94, y: 268, originX: 0, originY: 0
$.card3.states.animationOptions = curve: "spring(200, 20, 0)"


activeDot.states.add
	two: x: 367
	three: x: 418
activeDot.states.animationOptions = curve: "spring(400, 20, 0)"


$.card1.draggable.enabled = true
$.card2.draggable.enabled = true
$.card3.draggable.enabled = true

$.card1.draggable.vertical = false
$.card2.draggable.vertical = false
$.card3.draggable.vertical = false

# Event listener
$.card1.on Events.DragEnd, ->
	if  $.card1.x < 15
		$.card1.states.switch("two")
		$.card2.states.switch("two")
		$.card3.states.switch("two")
		activeDot.states.switch("two")
	else
		$.card1.states.switch("default")
		$.card2.states.switch("default")
		$.card3.states.switch("default")


$.card2.on Events.DragEnd, ->
	if  $.card2.x > 160
		$.card1.states.switch("default")
		$.card2.states.switch("default")
		$.card3.states.switch("default")
		activeDot.states.switch("default")
	else if $.card2.x < 15
		$.card1.states.switch("three")
		$.card2.states.switch("three")
		$.card3.states.switch("three")
		activeDot.states.switch("three")
	else
		$.card1.states.switch("two")
		$.card2.states.switch("two")
		$.card3.states.switch("two")
		activeDot.states.switch("two")
		
$.card3.on Events.DragEnd, ->
	if	$.card3.x > 160
		$.card3.states.switch("two")
		$.card2.states.switch("two")
		$.card1.states.switch("two")
		activeDot.states.switch("two")
	else if $.card3.x < 15
		$.card1.states.switch("three")
		$.card2.states.switch("three")
		$.card3.states.switch("three")
		activeDot.states.switch("three")



