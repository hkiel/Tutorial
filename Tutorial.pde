size(400, 300);  // Fenster mit 400x300 Pixeln öffnen
background(0);   // Fenster komplett schwarz füllen

// Füllfarbe für nachfolgende flächige Zeichnungen auf blau setzen
fill(0, 0, 255);
noStroke();      // keine Umrandung für flächige Zeichnungen

/* Zeichne Raumschiff als Dreieck mit den Eckpunkten
 * (50,100), (50,150), (100,125)
 */
triangle(50, 100, 50, 150, 100, 125);

// zeichne Asteroid
fill(140, 90, 35); // Füllfarbe braun
ellipse(250, 100, 50, 50); // zeichne Kreis
