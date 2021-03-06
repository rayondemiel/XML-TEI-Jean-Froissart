[![License: MIT](https://img.shields.io/badge/License-MIT--Licence-lightgrey.svg)](https://mit-license.org/)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-no-red.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
[![made-with-python](https://img.shields.io/badge/Made%20with-xslt-1f425f.svg)](https://www.w3.org/TR/xslt-30/)


# :scroll: Edition critique des *Chroniques* de Jean Froissart

Ce projet d'édition numérique de l'oeuvre du chroniqueur français Jean Froissart est le résultat des travaux menés dans le cadre du cours de XML-TEI dispensé 
par [Ségolène Albouy](https://github.com/Segolene-Albouy) à l'Ecole des nationales des chartes. L'édition prend pour appui sur la publication web du [OnlineFroissart](https://www.dhi.ac.uk/onlinefroissart/index.jsp) 
mené par Peter Ainsworth et Godfried Croenen. 

La transformation a été effectué via XSLT dans le cadre du cours "Techniques et chaîne de publication électronique" dispensé par [Ariane Pinche](https://github.com/ArianePinche)

---
## Résumé
Les *Chroniques* est un récit en prose sur les événements de la guerre de Cent Ans (1337-1353) entre les différentes monarchies européennes. L'extrait édité traite de l'année 1328 où se déroule la succession du roi de France suite à la mort de Charles IV le Bel, qui dans le cadre de la loi
Ce passage traite de l'année 1328, année où se déroule la succession du roi de France suite à la mort de Charles IV le Bel, qui dans le cadre de la loi salique revient à Philippe de la maison des Valois.
Ce changement de maison royal intervient à l'aube de la guerre de Cent Ans et de la révolte des milices flamandes contre le comte de Flandre Louis de Nevers, cousin du roi Philippe VI. La bataille de Cassel dont la victoire des armées du roi permet le rétablissement de l'autorité seigneuriale.

---
## Les témoins

L'édition s'appui sur trois témoins divers :
- **MS M. 804** de la Morgan Library allant du folio 15 verso au folio 16 verso du livre 1.
- **MS Cod. 329** de la Bibliothèque centrale de Courtrai allant du folio 23 recto à folio 24 recto.
- **MS Francais 2663** de la Bibliothèque nationale de France allant du folio 28 recto au folio 29 recto du livre 1.

---
## Structure du repository

Ce dossier contient un ensemble de 4 fichiers :
- Le fichier xml de l'édition : `Edition_JeanFroissart.xml`
- La documentation ODD au format XML et HTML au sein du dossier `docs/`
- Le schéma RELAX RNG présent au sein du dossier `out/`
- La transformation a été effectué via `froissart.xsl`
- Les fichiers html sont présents au sein du dossier `HTML/`
