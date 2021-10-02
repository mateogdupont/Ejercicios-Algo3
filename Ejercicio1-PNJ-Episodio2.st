!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'MGD 9/29/2021 15:56:23'!
carolinaLaCurandera
	^CarolinaCuranderaDeRiverwood.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'MGD 9/29/2021 15:57:34'!
hamilton
	^#hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'MGD 9/29/2021 15:57:30'!
tirion
	^#tirion.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'MGD 9/29/2021 15:57:25'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MGD 10/1/2021 09:07:07'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^(PuebloRiverwood esPrometedor: unPersonaje).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MGD 10/1/2021 09:17:50'!
hacerQueLaCuranderaOlvideSusInteracciones
	CarolinaCuranderaDeRiverwood olvidarTodasLasInteracciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MGD 10/2/2021 10:25:28'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloRiverwood olvidarTodasLasCalificaciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MGD 10/2/2021 10:24:18'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloRiverwood verComoPrometedorA: self hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'MGD 10/1/2021 09:17:50'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidarTodasLasInteracciones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'MGD 9/29/2021 14:50:20'!
hamilton
	^#hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'MGD 9/29/2021 14:49:54'!
tirion
	^#tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MGD 10/1/2021 09:17:50'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidarTodasLasInteracciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MGD 10/2/2021 10:26:07'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloRiverwood olvidarTodasLasCalificaciones .! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MGD 10/2/2021 10:24:40'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloRiverwood verComoPrometedorA: self hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PuebloRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PuebloRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuebloRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
PuebloRiverwood class
	instanceVariableNames: 'calificacionesDeLosPersonajes'!

!PuebloRiverwood class methodsFor: 'interacciones' stamp: 'MGD 10/2/2021 11:23:11'!
todosSusNpcOlvidanLasInteraccionesCon: aPerson
	CarolinaCuranderaDeRiverwood olvidarInteraccionesCon: aPerson. 
	TreborElGuardiaDeSkyrim olvidarInteraccionesCon: aPerson.! !


!PuebloRiverwood class methodsFor: 'calificaciones' stamp: 'MGD 10/1/2021 09:58:20'!
esDesconocido: aPerson
	^ (PuebloRiverwood obtenerCalificacionDe: aPerson) = 'Desconocido'.! !

!PuebloRiverwood class methodsFor: 'calificaciones' stamp: 'MGD 10/1/2021 09:58:20'!
esPrometedor: aPerson
	^ (PuebloRiverwood obtenerCalificacionDe: aPerson) = 'Prometedor'.! !

!PuebloRiverwood class methodsFor: 'calificaciones' stamp: 'MGD 10/2/2021 10:25:28'!
olvidarTodasLasCalificaciones
	calificacionesDeLosPersonajes := Dictionary new.! !

!PuebloRiverwood class methodsFor: 'calificaciones' stamp: 'MGD 10/2/2021 10:24:18'!
verComoPrometedorA: aPerson
	calificacionesDeLosPersonajes at: aPerson put: 'Prometedor'.! !


!PuebloRiverwood class methodsFor: 'calificaciones - privado' stamp: 'MGD 10/1/2021 09:58:20'!
obtenerCalificacionDe: aPerson
	^calificacionesDeLosPersonajes at: aPerson ifAbsent: ['Desconocido'].! !


!PuebloRiverwood class methodsFor: 'as yet unclassified' stamp: 'MGD 10/2/2021 11:24:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	calificacionesDeLosPersonajes := ((Dictionary new)).! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frasesDesconocidos frasesPrometedores cantidadDeInteraccionesConPersonajes'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'MGD 10/1/2021 09:49:51'!
interactuarCon: aPerson
	self recordarInteraccionCon: aPerson.
	^ self respuestaSegunCalificacionDe: aPerson.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'MGD 10/1/2021 09:05:34'!
olvidarInteraccionesCon: aPerson
	cantidadDeInteraccionesConPersonajes at: aPerson put: 0.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'MGD 10/1/2021 09:17:50'!
olvidarTodasLasInteracciones
	cantidadDeInteraccionesConPersonajes := Dictionary new.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MGD 10/1/2021 09:51:54'!
obtenerInteraccionesCon: aPerson
	^ cantidadDeInteraccionesConPersonajes at: aPerson ifAbsent: [0].
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MGD 9/29/2021 14:54:32'!
recordarInteraccionCon: aPerson
	|cantidadAnteriorDeIteracciones|	
	cantidadAnteriorDeIteracciones := self obtenerInteraccionesCon: aPerson.
	cantidadDeInteraccionesConPersonajes at: aPerson put: (cantidadAnteriorDeIteracciones + 1).
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MGD 10/1/2021 10:09:09'!
respuestaSegunCalificacionDe: aPerson
	^(PuebloRiverwood esPrometedor: aPerson) ifTrue: [self respuestaSegunCantidadDeInteraccionesConPrometedor: aPerson] ifFalse: [self respuestaSegunCantidadDeInteraccionesConDesconocido: aPerson].! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MGD 10/1/2021 10:08:51'!
respuestaSegunCantidadDeInteraccionesConDesconocido: aPerson
	^ frasesDesconocidos at: ((self obtenerInteraccionesCon: aPerson ) min: frasesDesconocidos size).! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MGD 10/1/2021 10:09:09'!
respuestaSegunCantidadDeInteraccionesConPrometedor: aPerson
	^ frasesPrometedores at: ((self obtenerInteraccionesCon: aPerson ) min: frasesPrometedores size).! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'MGD 10/2/2021 11:24:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesDesconocidos := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesPrometedores := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	cantidadDeInteraccionesConPersonajes := ((Dictionary new) add: (#hamilton->1); yourself).! !


!classDefinition: #CarolinaCuranderaDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim subclass: #CarolinaCuranderaDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaCuranderaDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaCuranderaDeRiverwood class
	instanceVariableNames: ''!

!CarolinaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'MGD 10/1/2021 09:48:00'!
interactuarCon: aPerson
	|respuestaSegunCalificacion|
	self recordarInteraccionCon: aPerson.
	respuestaSegunCalificacion := self respuestaSegunCalificacionDe: aPerson.
	self segunSiCumpleParaSerPrometedorReconocerloComoTal: aPerson.
	^respuestaSegunCalificacion. 
	! !


!CarolinaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'MGD 10/2/2021 11:23:12'!
influenciarARiverwoodParaSerCalificadoComoPrometedorA: aPerson
	PuebloRiverwood verComoPrometedorA: aPerson. 
	PuebloRiverwood todosSusNpcOlvidanLasInteraccionesCon: aPerson.
	! !

!CarolinaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'MGD 10/2/2021 10:56:00'!
segunSiCumpleParaSerPrometedorReconocerloComoTal: aPerson
	(self verificarSiCumpleCondicionesParaSerPrometedor: aPerson) ifTrue: [self influenciarARiverwoodParaSerCalificadoComoPrometedorA: aPerson] ifFalse: [].
	! !

!CarolinaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'MGD 10/1/2021 10:11:40'!
terminoElRepertorioDeFrases: aPerson
	^ ((self obtenerInteraccionesCon: aPerson) = 3).
	! !

!CarolinaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'MGD 10/1/2021 09:44:59'!
verificarSiCumpleCondicionesParaSerPrometedor: aPerson
	^(PuebloRiverwood esDesconocido: aPerson ) & (self terminoElRepertorioDeFrases: aPerson).
	! !


!CarolinaCuranderaDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'MGD 10/2/2021 11:24:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesDesconocidos := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesPrometedores := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	cantidadDeInteraccionesConPersonajes := ((Dictionary new) add: (#hamilton->2); yourself).! !

PuebloRiverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!
CarolinaCuranderaDeRiverwood initializeAfterFileIn!