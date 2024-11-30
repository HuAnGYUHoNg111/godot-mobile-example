# Godot 4.3 Mobile Template

See example: https://symphonious-fairy-94ef1f.netlify.app/

This project uses the virtual joystick plugin which works great out of the box. The main things I added was a bit of logic to make sure the buttons worked with the touch events and a full screen toggle. The main thing to get buttons to work in Godot 4 is to make sure the project settings have the "Pointer" settings enabled so the following two settings are on:

- Emulate Touch From Mouse (On)
- Emulate Mouse from Touch (On)

This is a quick sample I made to see what it takes to make a web export that will work with mobile phones. Keyboard events also work for easier development.

## Spinning a cube with drag motions

I also added the ability to drag across part of the screen to spin a cube. This is mostly accomplished using the InputEventScreenDrag event type and some basic drag and friction. The 3d cube uses a sub-viewport to show the 3d model over the GUI if you haven't done that before.


## Background

I wanted an easy and quick way to test out demos and projects using Godot. I currently had a project on my laptop that worked with basic keyboard controls only. I didn't think that would be a good format to do play testing in the future. I thought the easiest way to do this would be to export a project using the HTML5 export and share a link. This might just be a reference for me as I update UIs to work with touch and dragging on a phone/tablet. I am not sure if anyone else will use this, but I thought I would throw it out to the internet just in case.
