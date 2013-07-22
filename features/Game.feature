# language: de

Funktionalität: Spielvorbereitung

	Szenario: Spielerstellung
	Ein registrierter Nutzer möchte gerne
	ein Spiel als Gamemaster erstellen.
	Angenommen Es existiert ein Nutzer der angemeldet ist
	Wenn dieser dann die Seite zum Spiel erstellen besucht
	Und dieser dann ein Spiel erstellt mit "2" Kreisen erstellt
	Dann Existiert ein Spiel mit "2" Kreisen
	Und er ist Gamemaster dieses Spiels
  
  Szenario: Teilnahme am Spiel
  Ein registrierter Nutzer möchte am Spiel Teilnehmen
  Angenommen Es existiert ein Nutzer der angemeldet ist
  Und ein Spiel bei dem er nicht Gamemaster ist
  Wenn dieser dann dem Spiel beitritt
  Dann ist er als Mitspieler registriert