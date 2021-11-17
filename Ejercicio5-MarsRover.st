!classDefinition: #TestsMarsRover category: 'Ejercicio5-MarsRover'!
TestCase subclass: #TestsMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio5-MarsRover'!

!TestsMarsRover methodsFor: 'privado' stamp: 'MGD 11/17/2021 17:45:23'!
assert: unMarsRover seEncuentraEn: unaUbicacion orientadoHacia: unPuntoCardinal
	self assert: (unMarsRover seEncuentraUbicadoEn: unaUbicacion ).
	self assert: (unMarsRover seEncuentraOrientadoHacia: unPuntoCardinal).! !

!TestsMarsRover methodsFor: 'privado' stamp: 'LMG 11/14/2021 17:41:54'!
assertSeDesplegaUnMarsRoverEn: unaUbicacion orientadoHacia: unPuntoCardinal enviandole: comandos resultaOrientadoHacia: unPuntoCardinalFinal

	|marsRover|	
		
	marsRover := self desplegarUnMarsRoverEn: unaUbicacion orientadoHacia: unPuntoCardinal enviandole: comandos.	
	self assert: (marsRover seEncuentraOrientadoHacia: unPuntoCardinalFinal).! !

!TestsMarsRover methodsFor: 'privado' stamp: 'LMG 11/14/2021 18:22:18'!
assertSeDesplegaUnMarsRoverEn: unaUbicacion orientadoHacia: unPuntoCardinal enviandole: comandos resultaUbicadoEn: unaUbicacionFinal

	|marsRover|	
		
	marsRover := self desplegarUnMarsRoverEn: unaUbicacion orientadoHacia: unPuntoCardinal enviandole: comandos.	
	self assert: (marsRover seEncuentraUbicadoEn: unaUbicacionFinal).! !

!TestsMarsRover methodsFor: 'privado' stamp: 'LMG 11/14/2021 17:14:07'!
desplegarUnMarsRoverEn: unaUbicacion orientadoHacia: unPuntoCardinal enviandole: comandos

	|marsRover|
	
	marsRover := MarsRover desplegarEn: unaUbicacion orientadoHacia: unPuntoCardinal.	
	marsRover realizarMultiplesMoviemientosAPartirDe: comandos.
	^marsRover.! !


!TestsMarsRover methodsFor: 'puntosCardinales' stamp: 'LMG 11/14/2021 18:19:49'!
puntoCardinalEste
	^#Este! !

!TestsMarsRover methodsFor: 'puntosCardinales' stamp: 'LMG 11/14/2021 18:19:37'!
puntoCardinalNorte
	^#Norte! !

!TestsMarsRover methodsFor: 'puntosCardinales' stamp: 'LMG 11/14/2021 18:20:16'!
puntoCardinalOeste
	^#Oeste! !

!TestsMarsRover methodsFor: 'puntosCardinales' stamp: 'LMG 11/14/2021 18:20:04'!
puntoCardinalSur
	^#Sur! !


!TestsMarsRover methodsFor: 'setUp' stamp: 'LMG 11/14/2021 17:02:09'!
setUp
	! !


!TestsMarsRover methodsFor: 'test - comando backwards' stamp: 'MGD 11/17/2021 19:21:05'!
test07AlEnviarAUnMarsRoverOrientadoHaciaElNorteUnComandoBackwardsRealizaUnMovimientoHaciaAtrasEnDichaDireccion
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalNorte) enviandole: 'b' resultaUbicadoEn: (0@-1).! !

!TestsMarsRover methodsFor: 'test - comando backwards' stamp: 'MGD 11/17/2021 19:21:22'!
test08AlEnviarAUnMarsRoverOrientadoHaciaElSurUnComandoBackwardsRealizaUnMovimientoHaciaAtrasEnDichaDireccion
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalSur) enviandole: 'b' resultaUbicadoEn: (0@1).! !

!TestsMarsRover methodsFor: 'test - comando backwards' stamp: 'MGD 11/17/2021 19:21:36'!
test09AlEnviarAUnMarsRoverOrientadoHaciaElEsteUnComandoBackwardsRealizaUnMovimientoHaciaAtrasEnDichaDireccion
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalEste) enviandole: 'b' resultaUbicadoEn: (-1@0).! !

!TestsMarsRover methodsFor: 'test - comando backwards' stamp: 'MGD 11/17/2021 19:21:52'!
test10AlEnviarAUnMarsRoverOrientadoHaciaElOesteUnComandoBackwardsRealizaUnMovimientoHaciaAtrasEnDichaDireccion
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalOeste) enviandole: 'b' resultaUbicadoEn: (1@0).! !


!TestsMarsRover methodsFor: 'test - comando compuesto' stamp: 'MGD 11/17/2021 17:49:36'!
test19AlEnviarAUnMarsRoverMultiplesComandosForwardRealizaMultiplesMovimientosHaciaAdelante
	self 
		assertSeDesplegaUnMarsRoverEn: (0@0) 
		orientadoHacia: (self puntoCardinalNorte) 
		enviandole: 'ffff' 
		resultaUbicadoEn: (0@4).! !

!TestsMarsRover methodsFor: 'test - comando compuesto' stamp: 'MGD 11/17/2021 16:29:08'!
test20AlEnviarAUnMarsRoverMultiplesComandosBackwardsRealizaMultiplesMovimientosHaciaAtras
	self 
		assertSeDesplegaUnMarsRoverEn: (0@0) 
		orientadoHacia: (self puntoCardinalNorte) 
		enviandole: 'bbbb' 
		resultaUbicadoEn:(0@-4).! !

!TestsMarsRover methodsFor: 'test - comando compuesto' stamp: 'MGD 11/17/2021 18:59:45'!
test21AlEnviarAUnMarsRoverMultiplesComandosRightRealizaMultiplesRotacionesHaciaLaDerecha
"Consideramos importante testear este caso en particular desde una perspectiva de testing y no de TDD, debido a que esta implementacion ya pasaba la prueba al momento de ser creada."
	self 
		assertSeDesplegaUnMarsRoverEn: (0@0) 
		orientadoHacia: (self puntoCardinalNorte) 
		enviandole: 'rrrr' 
		resultaOrientadoHacia: (self puntoCardinalNorte)! !

!TestsMarsRover methodsFor: 'test - comando compuesto' stamp: 'MGD 11/17/2021 18:59:39'!
test22AlEnviarAUnMarsRoverMultiplesComandosLeftRealizaMultiplesRotacionesHaciaLaIzquierda
"Consideramos importante testear este caso en particular desde una perspectiva de testing y no de TDD, debido a que esta implementacion ya pasaba la prueba al momento de ser creada."
	
	self 
		assertSeDesplegaUnMarsRoverEn: (0@0) 
		orientadoHacia: (self puntoCardinalNorte) 
		enviandole: 'llll' 
		resultaOrientadoHacia: (self puntoCardinalNorte)! !

!TestsMarsRover methodsFor: 'test - comando compuesto' stamp: 'MGD 11/17/2021 18:59:24'!
test23AlEnviarAUnMarsRoverMultiplesComandosResultaEnLaOrientacionYUbicacionEsperadas
"Consideramos importante testear este caso en particular desde una perspectiva de testing y no de TDD, debido a que esta implementacion ya pasaba la prueba al momento de ser creada."

	| marsRover |

	marsRover := self desplegarUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalNorte) enviandole: 'frflblfr'.	
	
	self assert: marsRover seEncuentraEn: (0@0) orientadoHacia: (self puntoCardinalNorte).! !


!TestsMarsRover methodsFor: 'test - comando forward' stamp: 'MGD 11/17/2021 19:18:47'!
test03AlEnviarAUnMarsRoverOrientadoHaciaElNorteUnComandoForwardRealizaUnMovimientoHaciaAdelanteEnDichaDireccion
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalNorte) enviandole: 'f' resultaUbicadoEn: (0@1).! !

!TestsMarsRover methodsFor: 'test - comando forward' stamp: 'MGD 11/17/2021 19:19:38'!
test04AlEnviarAUnMarsRoverOrientadoHaciaElSurUnComandoForwardRealizaUnMovimientoHaciaAdelanteEnDichaDireccion
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalSur) enviandole: 'f' resultaUbicadoEn: (0@-1).! !

!TestsMarsRover methodsFor: 'test - comando forward' stamp: 'MGD 11/17/2021 19:19:52'!
test05AlEnviarAUnMarsRoverOrientadoHaciaElEsteUnComandoForwardRealizaUnMovimientoHaciaAdelanteEnDichaDireccion
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalEste) enviandole: 'f' resultaUbicadoEn: (1@0).! !

!TestsMarsRover methodsFor: 'test - comando forward' stamp: 'MGD 11/17/2021 19:20:08'!
test06AlEnviarAUnMarsRoverOrientadoHaciaElOesteUnComandoForwardRealizaUnMovimientoHaciaAdelanteEnDichaDireccion
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalOeste) enviandole: 'f' resultaUbicadoEn: (-1@0).! !


!TestsMarsRover methodsFor: 'test - comando left' stamp: 'MGD 11/17/2021 19:22:54'!
test11AlEnviarAUnMarsRoverOrientadoHaciaElNorteUnComandoLeftResultaOrientadoHaciaElOeste
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalNorte) enviandole: 'l' resultaOrientadoHacia: (self puntoCardinalOeste).! !

!TestsMarsRover methodsFor: 'test - comando left' stamp: 'MGD 11/17/2021 19:23:23'!
test12AlEnviarAUnMarsRoverOrientadoHaciaElSurUnComandoLeftResultaOrientadoHaciaElEste
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalSur) enviandole: 'l' resultaOrientadoHacia: (self puntoCardinalEste).! !

!TestsMarsRover methodsFor: 'test - comando left' stamp: 'MGD 11/17/2021 19:23:44'!
test13AlEnviarAUnMarsRoverOrientadoHaciaElEsteUnComandoLeftResultaOrientadoHaciaElNorte
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalEste) enviandole: 'l' resultaOrientadoHacia: (self puntoCardinalNorte).! !

!TestsMarsRover methodsFor: 'test - comando left' stamp: 'MGD 11/17/2021 19:24:05'!
test14AlEnviarAUnMarsRoverOrientadoHaciaElOesteUnComandoLeftResultaOrientadoHaciaElSur
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalOeste) enviandole: 'l' resultaOrientadoHacia: (self puntoCardinalSur).! !


!TestsMarsRover methodsFor: 'test - comando right' stamp: 'MGD 11/17/2021 19:24:54'!
test15AlEnviarAUnMarsRoverOrientadoHaciaElNorteUnComandoRightResultaOrientadoHaciaElEste
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalNorte) enviandole: 'r' resultaOrientadoHacia: (self puntoCardinalEste).! !

!TestsMarsRover methodsFor: 'test - comando right' stamp: 'MGD 11/17/2021 19:25:20'!
test16AlEnviarAUnMarsRoverOrientadoHaciaElSurUnComandoRightResultaOrientadoHaciaElOeste
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalSur) enviandole: 'r' resultaOrientadoHacia: (self puntoCardinalOeste).! !

!TestsMarsRover methodsFor: 'test - comando right' stamp: 'MGD 11/17/2021 19:25:39'!
test17AlEnviarAUnMarsRoverOrientadoHaciaElEsteUnComandoRightResultaOrientadoHaciaElSur
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalEste) enviandole: 'r' resultaOrientadoHacia: (self puntoCardinalSur).! !

!TestsMarsRover methodsFor: 'test - comando right' stamp: 'MGD 11/17/2021 19:25:59'!
test18AlEnviarAUnMarsRoverOrientadoHaciaElOesteUnComandoRightResultaOrientadoHaciaElNorte
	self assertSeDesplegaUnMarsRoverEn: (0@0) orientadoHacia: (self puntoCardinalOeste) enviandole: 'r' resultaOrientadoHacia: (self puntoCardinalNorte).! !


!TestsMarsRover methodsFor: 'test - errores' stamp: 'MGD 11/17/2021 17:50:57'!
test24UnMarsRoverNoPuedeSerDesplegadoEnUnaUbicacionInvalida
	
	self
		should: [MarsRover desplegarEn: 'PuntoInvalido' orientadoHacia: self puntoCardinalNorte.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover descripcionDeErrorAlDesplegarEnUbicacionInvalida.
		]! !

!TestsMarsRover methodsFor: 'test - errores' stamp: 'MGD 11/17/2021 19:13:53'!
test25UnMarsRoverNoPuedeSerDesplegadoConUnaOrientacionInvalida
	
	self
		should: [MarsRover desplegarEn: (0@0) orientadoHacia: #PuntoCardinalInvalido.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OrientacionDeMarsRover descripcionDeErrorPuntoCardinalInvalido.
		].! !

!TestsMarsRover methodsFor: 'test - errores' stamp: 'MGD 11/17/2021 17:52:21'!
test26UnMarsRoverNoPuedeRealizarMovimientosAPartirDeUnStringDeComandosVacio
	|marsRover|
	
	marsRover := MarsRover desplegarEn: (0@0) orientadoHacia: self puntoCardinalNorte.
	
	self
		should: [marsRover realizarMultiplesMoviemientosAPartirDe: '']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover descripcionDeErrorStringDeComandosVacio.
			self assert: marsRover seEncuentraEn: (0@0) orientadoHacia: (self puntoCardinalNorte).
		].! !

!TestsMarsRover methodsFor: 'test - errores' stamp: 'MGD 11/17/2021 17:53:07'!
test27UnMarsRoverNoPuedeRealizarMovimientosAPartirDeUnStringDeComandosConUnUnicoComandoInvalido
	|marsRover|
	
	marsRover := MarsRover desplegarEn: (0@0) orientadoHacia: self puntoCardinalNorte.

	self
		should: [marsRover realizarMultiplesMoviemientosAPartirDe: 'W']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover descripcionDeErrorComandoInvalido.
			self assert: marsRover seEncuentraEn: (0@0) orientadoHacia: (self puntoCardinalNorte).
		].! !

!TestsMarsRover methodsFor: 'test - errores' stamp: 'MGD 11/17/2021 19:04:36'!
test28UnMarsRoverRealizaMovimientosAPartirDeUnStringDeComandosHastaElUltimoComandoQueResultaSerInvalido
	
	|marsRover|
	
	marsRover := MarsRover desplegarEn: (0@0) orientadoHacia: self puntoCardinalNorte.

	self
		should: [marsRover realizarMultiplesMoviemientosAPartirDe: 'frffW']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover descripcionDeErrorComandoInvalido.
			self assert: marsRover seEncuentraEn: (2@1) orientadoHacia: (self puntoCardinalEste).
		].! !

!TestsMarsRover methodsFor: 'test - errores' stamp: 'MGD 11/17/2021 19:02:41'!
test29UnMarsRoverRealizaMovimientosAPartirDeUnStringDeComandosHastaEncontrarUnComandoInvalido
"Consideramos importante testear este caso en particular desde una perspectiva de testing y no de TDD, debido a que esta implementacion ya pasaba la prueba al momento de ser creada."

	|marsRover|
	
	marsRover := MarsRover desplegarEn: (0@0) orientadoHacia: self puntoCardinalNorte.

	self
		should: [marsRover realizarMultiplesMoviemientosAPartirDe: 'frffWbb']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover descripcionDeErrorComandoInvalido.
			self assert: marsRover seEncuentraEn: (2@1) orientadoHacia: (self puntoCardinalEste).
		].! !


!TestsMarsRover methodsFor: 'test - inicializacion' stamp: 'MGD 11/17/2021 15:32:58'!
test01UnMarsRoverSeEncuentraEnLaUbicacionEnLaCualFueDesplegado
	|marsRover|
	
	marsRover := MarsRover desplegarEn: (0@0) orientadoHacia: (self puntoCardinalNorte).	
	self assert: (marsRover seEncuentraUbicadoEn: (0@0)).
	! !

!TestsMarsRover methodsFor: 'test - inicializacion' stamp: 'MGD 11/17/2021 15:32:09'!
test02UnMarsRoverSeEncuentraOrientadoHaciaElPuntoCardinalConElCualFueDesplegado
	|marsRover|
	
	marsRover := MarsRover desplegarEn: (0@0) orientadoHacia: (self puntoCardinalNorte).	
	self assert: (marsRover seEncuentraOrientadoHacia: self puntoCardinalNorte).! !


!classDefinition: #MarsRover category: 'Ejercicio5-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'ubicacion orientacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio5-MarsRover'!

!MarsRover methodsFor: 'inicializacion' stamp: 'MGD 11/17/2021 18:22:36'!
inicializarEn: unPuntoInicial orientadoHacia: unPuntoCardinal
	
	(unPuntoInicial  isKindOf: Point) ifFalse: [self error: MarsRover descripcionDeErrorAlDesplegarEnUbicacionInvalida.].
	
	ubicacion := unPuntoInicial.		
	orientacion := OrientacionDeMarsRover hacia: unPuntoCardinal.! !


!MarsRover methodsFor: 'movimiento - privado' stamp: 'MGD 11/17/2021 18:19:47'!
modificarLaUbicacionSegun: unDesplazamiento
	ubicacion := ubicacion + unDesplazamiento.! !

!MarsRover methodsFor: 'movimiento - privado' stamp: 'MGD 11/17/2021 19:32:52'!
realizarUnMovimientoAPartirDe: unComando 
"Pese a la presencia de los if's consideramos que no seria correcto crear una clase para los Comandos ya que contentendrian un unico mensaje cada subclase. por lo cual estariamos sobremodelando el problema."
	(self esComandoMovimientoHaciaAdelante: unComando) ifTrue: [^self realizarMoviemientoHaciaAdelante.].
	(self esComandoMovimientoHaciaAtras: unComando) ifTrue: [^self realizarMoviemientoHaciaAtras.].
	(self esComandoRotacionHaciaIzquierda: unComando) ifTrue: [^self realizarRotacionHaciaLaIzquierda.].
	(self esComandoRotacionHaciaDerecha: unComando) ifTrue: [^self realizarRotacionHaciaLaDerecha.].
	^ self error: MarsRover descripcionDeErrorComandoInvalido.
	! !


!MarsRover methodsFor: 'movimiento - publico' stamp: 'MGD 11/17/2021 18:22:58'!
realizarMultiplesMoviemientosAPartirDe: unStringDeComandos

	(unStringDeComandos isEmpty) ifTrue: [^self error: MarsRover descripcionDeErrorStringDeComandosVacio.].
	unStringDeComandos do:[: unComando | self realizarUnMovimientoAPartirDe: unComando.		].
	

! !


!MarsRover methodsFor: 'movimientoAdelante' stamp: 'MGD 11/17/2021 18:22:05'!
realizarMoviemientoHaciaAdelante
	orientacion determinaElTipoDeMovimientoAlAvanzar: self.
! !

!MarsRover methodsFor: 'movimientoAdelante' stamp: 'MGD 11/17/2021 18:19:35'!
realizarMoviemientoHaciaAdelanteEstandoOrientadoHaciaElEste
	self modificarLaUbicacionSegun: (1@0).! !

!MarsRover methodsFor: 'movimientoAdelante' stamp: 'MGD 11/17/2021 18:19:35'!
realizarMoviemientoHaciaAdelanteEstandoOrientadoHaciaElNorte
	self modificarLaUbicacionSegun: (0@1).! !

!MarsRover methodsFor: 'movimientoAdelante' stamp: 'MGD 11/17/2021 18:19:35'!
realizarMoviemientoHaciaAdelanteEstandoOrientadoHaciaElOeste
	self modificarLaUbicacionSegun: (-1@0).! !

!MarsRover methodsFor: 'movimientoAdelante' stamp: 'MGD 11/17/2021 18:19:34'!
realizarMoviemientoHaciaAdelanteEstandoOrientadoHaciaElSur
	self modificarLaUbicacionSegun: (0@-1).! !


!MarsRover methodsFor: 'movimientoAtras' stamp: 'MGD 11/17/2021 18:22:10'!
realizarMoviemientoHaciaAtras
	orientacion determinaElTipoDeMovimientoAlRetroceder: self.! !

!MarsRover methodsFor: 'movimientoAtras' stamp: 'MGD 11/17/2021 18:19:35'!
realizarMoviemientoHaciaAtrasEstandoOrientadoHaciaElEste
	self modificarLaUbicacionSegun: (-1@0).! !

!MarsRover methodsFor: 'movimientoAtras' stamp: 'MGD 11/17/2021 18:19:34'!
realizarMoviemientoHaciaAtrasEstandoOrientadoHaciaElNorte
	self modificarLaUbicacionSegun: (0@-1).! !

!MarsRover methodsFor: 'movimientoAtras' stamp: 'MGD 11/17/2021 18:19:35'!
realizarMoviemientoHaciaAtrasEstandoOrientadoHaciaElOeste
	self modificarLaUbicacionSegun: (1@0).! !

!MarsRover methodsFor: 'movimientoAtras' stamp: 'MGD 11/17/2021 18:19:34'!
realizarMoviemientoHaciaAtrasEstandoOrientadoHaciaElSur
	self modificarLaUbicacionSegun: (0@1).! !


!MarsRover methodsFor: 'rotacionesADerecha' stamp: 'MGD 11/17/2021 18:22:15'!
realizarRotacionHaciaLaDerecha
	orientacion determinaElTipoDeRotacionADerechaDe: self.
! !

!MarsRover methodsFor: 'rotacionesADerecha' stamp: 'MGD 11/17/2021 18:27:47'!
realizarRotacionHaciaLaDerechaEstandoOrientadoHaciaElEste
	orientacion := OrientacionDeMarsRover hacia: #Sur.! !

!MarsRover methodsFor: 'rotacionesADerecha' stamp: 'MGD 11/17/2021 18:27:39'!
realizarRotacionHaciaLaDerechaEstandoOrientadoHaciaElNorte
	orientacion := OrientacionDeMarsRover hacia: #Este.! !

!MarsRover methodsFor: 'rotacionesADerecha' stamp: 'MGD 11/17/2021 18:27:33'!
realizarRotacionHaciaLaDerechaEstandoOrientadoHaciaElOeste
	orientacion := OrientacionDeMarsRover hacia: #Norte.! !

!MarsRover methodsFor: 'rotacionesADerecha' stamp: 'MGD 11/17/2021 18:27:24'!
realizarRotacionHaciaLaDerechaEstandoOrientadoHaciaElSur
	orientacion := OrientacionDeMarsRover hacia: #Oeste.! !


!MarsRover methodsFor: 'rotacionesAIzquierda' stamp: 'LMG 11/14/2021 16:12:14'!
realizarRotacionHaciaLaIzquierda
	orientacion determinaElTipoDeRotacionAIzquierdaDe: self.! !

!MarsRover methodsFor: 'rotacionesAIzquierda' stamp: 'MGD 11/17/2021 18:27:06'!
realizarRotacionHaciaLaIzquierdaEstandoOrientadoHaciaElEste
	orientacion := OrientacionDeMarsRover hacia: #Norte.! !

!MarsRover methodsFor: 'rotacionesAIzquierda' stamp: 'MGD 11/17/2021 18:26:51'!
realizarRotacionHaciaLaIzquierdaEstandoOrientadoHaciaElNorte
	orientacion := OrientacionDeMarsRover hacia: #Oeste.! !

!MarsRover methodsFor: 'rotacionesAIzquierda' stamp: 'MGD 11/17/2021 18:26:42'!
realizarRotacionHaciaLaIzquierdaEstandoOrientadoHaciaElOeste
	orientacion := OrientacionDeMarsRover hacia: #Sur.! !

!MarsRover methodsFor: 'rotacionesAIzquierda' stamp: 'MGD 11/17/2021 18:25:31'!
realizarRotacionHaciaLaIzquierdaEstandoOrientadoHaciaElSur
	orientacion := OrientacionDeMarsRover hacia: #Este.! !


!MarsRover methodsFor: 'testeo' stamp: 'LMG 11/14/2021 16:50:08'!
esComandoMovimientoHaciaAdelante: unComando
	^(unComando = $f). 
	! !

!MarsRover methodsFor: 'testeo' stamp: 'LMG 11/14/2021 16:49:54'!
esComandoMovimientoHaciaAtras: unComando
	^(unComando = $b). ! !

!MarsRover methodsFor: 'testeo' stamp: 'LMG 11/14/2021 16:49:31'!
esComandoRotacionHaciaDerecha: unComando
	^(unComando = $r). ! !

!MarsRover methodsFor: 'testeo' stamp: 'LMG 11/14/2021 16:49:45'!
esComandoRotacionHaciaIzquierda: unComando
	^(unComando = $l). ! !

!MarsRover methodsFor: 'testeo' stamp: 'LMG 11/14/2021 18:16:10'!
seEncuentraOrientadoHacia: unPuntoCardinal	
	^orientacion apuntaHacia: unPuntoCardinal.! !

!MarsRover methodsFor: 'testeo' stamp: 'LMG 11/14/2021 18:22:18'!
seEncuentraUbicadoEn: unaUbicacion
	^(unaUbicacion = ubicacion). ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio5-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MGD 11/17/2021 16:47:37'!
descripcionDeErrorAlDesplegarEnUbicacionInvalida
	^ 'Ubicacion invalida para desplegar un MarsRover.'.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'LMG 11/14/2021 16:53:57'!
descripcionDeErrorComandoInvalido
	 ^'El comando ingresado es invalido'! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MGD 11/17/2021 17:11:11'!
descripcionDeErrorStringDeComandosVacio
	^'El string de comandos no debe estar vacio'.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'LMG 11/14/2021 18:26:32'!
desplegarEn: unaUbicacion orientadoHacia: unPuntoCardinal 
	^ self new inicializarEn: unaUbicacion orientadoHacia: unPuntoCardinal.! !


!classDefinition: #OrientacionDeMarsRover category: 'Ejercicio5-MarsRover'!
Object subclass: #OrientacionDeMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio5-MarsRover'!

!OrientacionDeMarsRover methodsFor: 'testeo' stamp: 'LMG 11/14/2021 18:17:05'!
apuntaHacia: unPuntoCardinal
	self subclassResponsibility.! !


!OrientacionDeMarsRover methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/13/2021 20:29:35'!
determinaElTipoDeMovimientoAlAvanzar: unMarsRover
	self subclassResponsibility.! !

!OrientacionDeMarsRover methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/13/2021 20:29:41'!
determinaElTipoDeMovimientoAlRetroceder: unMarsRover
	self subclassResponsibility.! !

!OrientacionDeMarsRover methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/13/2021 20:16:03'!
determinaElTipoDeRotacionADerechaDe: unMarsRover
	self subclassResponsibility.! !

!OrientacionDeMarsRover methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/13/2021 20:16:42'!
determinaElTipoDeRotacionAIzquierdaDe: unMarsRover
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionDeMarsRover class' category: 'Ejercicio5-MarsRover'!
OrientacionDeMarsRover class
	instanceVariableNames: ''!

!OrientacionDeMarsRover class methodsFor: 'inicializacion' stamp: 'MGD 11/17/2021 16:54:38'!
puedeInicializarseCon: unPuntoCardinal
	self subclassResponsibility.! !


!OrientacionDeMarsRover class methodsFor: 'creacion' stamp: 'MGD 11/17/2021 19:14:43'!
hacia: unPuntoCardinal

	|subclaseSeleccionada|
	
	subclaseSeleccionada := OrientacionDeMarsRover subclasses detect: [ :subclass| 
		subclass puedeInicializarseCon: unPuntoCardinal.
	] ifNone: [self error: OrientacionDeMarsRover descripcionDeErrorPuntoCardinalInvalido].
	^ subclaseSeleccionada new.! !


!OrientacionDeMarsRover class methodsFor: 'error' stamp: 'MGD 11/17/2021 19:13:53'!
descripcionDeErrorPuntoCardinalInvalido
	^'No se puede orientar al MarsRover hacia un punto cardinal invalido'.! !


!classDefinition: #OrientacionEste category: 'Ejercicio5-MarsRover'!
OrientacionDeMarsRover subclass: #OrientacionEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio5-MarsRover'!

!OrientacionEste methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:27:58'!
determinaElTipoDeMovimientoAlAvanzar: unMarsRover
	unMarsRover realizarMoviemientoHaciaAdelanteEstandoOrientadoHaciaElEste.! !

!OrientacionEste methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:02'!
determinaElTipoDeMovimientoAlRetroceder: unMarsRover
	unMarsRover realizarMoviemientoHaciaAtrasEstandoOrientadoHaciaElEste.! !

!OrientacionEste methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:05'!
determinaElTipoDeRotacionADerechaDe: unMarsRover
	unMarsRover realizarRotacionHaciaLaDerechaEstandoOrientadoHaciaElEste.! !

!OrientacionEste methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:09'!
determinaElTipoDeRotacionAIzquierdaDe: unMarsRover
	unMarsRover realizarRotacionHaciaLaIzquierdaEstandoOrientadoHaciaElEste.! !


!OrientacionEste methodsFor: 'testeo' stamp: 'LMG 11/14/2021 18:16:53'!
apuntaHacia: unPuntoCardinal
	^ (unPuntoCardinal = #Este).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionEste class' category: 'Ejercicio5-MarsRover'!
OrientacionEste class
	instanceVariableNames: ''!

!OrientacionEste class methodsFor: 'inicializacion' stamp: 'MGD 11/17/2021 16:53:30'!
puedeInicializarseCon: unPuntoCardinal
	^(unPuntoCardinal = #Este).! !


!classDefinition: #OrientacionNorte category: 'Ejercicio5-MarsRover'!
OrientacionDeMarsRover subclass: #OrientacionNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio5-MarsRover'!

!OrientacionNorte methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:18'!
determinaElTipoDeMovimientoAlAvanzar: unMarsRover
	unMarsRover realizarMoviemientoHaciaAdelanteEstandoOrientadoHaciaElNorte.! !

!OrientacionNorte methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:24'!
determinaElTipoDeMovimientoAlRetroceder: unMarsRover
	unMarsRover realizarMoviemientoHaciaAtrasEstandoOrientadoHaciaElNorte.! !

!OrientacionNorte methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:27'!
determinaElTipoDeRotacionADerechaDe: unMarsRover
	unMarsRover realizarRotacionHaciaLaDerechaEstandoOrientadoHaciaElNorte.! !

!OrientacionNorte methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:31'!
determinaElTipoDeRotacionAIzquierdaDe: unMarsRover
	unMarsRover realizarRotacionHaciaLaIzquierdaEstandoOrientadoHaciaElNorte.! !


!OrientacionNorte methodsFor: 'testeo' stamp: 'LMG 11/14/2021 18:17:15'!
apuntaHacia: unPuntoCardinal
	^ (unPuntoCardinal = #Norte).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionNorte class' category: 'Ejercicio5-MarsRover'!
OrientacionNorte class
	instanceVariableNames: ''!

!OrientacionNorte class methodsFor: 'inicializacion' stamp: 'MGD 11/17/2021 16:53:49'!
puedeInicializarseCon: unPuntoCardinal
	^(unPuntoCardinal = #Norte).! !


!classDefinition: #OrientacionOeste category: 'Ejercicio5-MarsRover'!
OrientacionDeMarsRover subclass: #OrientacionOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio5-MarsRover'!

!OrientacionOeste methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:37'!
determinaElTipoDeMovimientoAlAvanzar: unMarsRover
	unMarsRover realizarMoviemientoHaciaAdelanteEstandoOrientadoHaciaElOeste.! !

!OrientacionOeste methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:42'!
determinaElTipoDeMovimientoAlRetroceder: unMarsRover
	unMarsRover realizarMoviemientoHaciaAtrasEstandoOrientadoHaciaElOeste.! !

!OrientacionOeste methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:46'!
determinaElTipoDeRotacionADerechaDe: unMarsRover
	unMarsRover realizarRotacionHaciaLaDerechaEstandoOrientadoHaciaElOeste.! !

!OrientacionOeste methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:50'!
determinaElTipoDeRotacionAIzquierdaDe: unMarsRover
	unMarsRover realizarRotacionHaciaLaIzquierdaEstandoOrientadoHaciaElOeste.! !


!OrientacionOeste methodsFor: 'testeo' stamp: 'LMG 11/14/2021 18:17:23'!
apuntaHacia: unPuntoCardinal
	^ (unPuntoCardinal = #Oeste).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionOeste class' category: 'Ejercicio5-MarsRover'!
OrientacionOeste class
	instanceVariableNames: ''!

!OrientacionOeste class methodsFor: 'inicializacion' stamp: 'MGD 11/17/2021 16:54:06'!
puedeInicializarseCon: unPuntoCardinal
	^(unPuntoCardinal = #Oeste).! !


!classDefinition: #OrientacionSur category: 'Ejercicio5-MarsRover'!
OrientacionDeMarsRover subclass: #OrientacionSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio5-MarsRover'!

!OrientacionSur methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:55'!
determinaElTipoDeMovimientoAlAvanzar: unMarsRover
	unMarsRover realizarMoviemientoHaciaAdelanteEstandoOrientadoHaciaElSur.! !

!OrientacionSur methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:28:59'!
determinaElTipoDeMovimientoAlRetroceder: unMarsRover
	unMarsRover realizarMoviemientoHaciaAtrasEstandoOrientadoHaciaElSur.! !

!OrientacionSur methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:29:03'!
determinaElTipoDeRotacionADerechaDe: unMarsRover
	unMarsRover realizarRotacionHaciaLaDerechaEstandoOrientadoHaciaElSur.! !

!OrientacionSur methodsFor: 'movimientosMarsRover' stamp: 'MGD 11/17/2021 19:29:06'!
determinaElTipoDeRotacionAIzquierdaDe: unMarsRover
	unMarsRover realizarRotacionHaciaLaIzquierdaEstandoOrientadoHaciaElSur.! !


!OrientacionSur methodsFor: 'testeo' stamp: 'LMG 11/14/2021 18:17:29'!
apuntaHacia: unPuntoCardinal
	^ (unPuntoCardinal = #Sur).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionSur class' category: 'Ejercicio5-MarsRover'!
OrientacionSur class
	instanceVariableNames: ''!

!OrientacionSur class methodsFor: 'inicializacion' stamp: 'MGD 11/17/2021 16:54:18'!
puedeInicializarseCon: unPuntoCardinal
	^(unPuntoCardinal = #Sur).! !
