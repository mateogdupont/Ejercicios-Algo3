!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'johnLennon paulMcCartney ringoStarr'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'LMG 10/14/2021 11:52:54'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assert: (self seRealiza: [customerBook addCustomerNamed: johnLennon.] enMenosDe: 50 * millisecond ).
	
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LMG 10/14/2021 11:58:00'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := self crearUnCustomerBookConUnClienteLlamado: paulMcCartney.
	
	self assert: (self seRealiza: [customerBook removeCustomerNamed: paulMcCartney.] enMenosDe: 100 * millisecond).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LMG 10/13/2021 16:25:26'!
test03CanNotAddACustomerWithEmptyName

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self intentoEjecutar: [customerBook addCustomerNamed: ''.] 
		queDebePresentar: Error 
		seEjecuta: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty 
		].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LMG 10/14/2021 11:57:49'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
	
	customerBook := self crearUnCustomerBookConUnClienteLlamado: johnLennon.
	
	self intentoEjecutar:  [ customerBook removeCustomerNamed: paulMcCartney.] 
		queDebePresentar: NotFound 
		seEjecuta: [ self elUnicoClienteEn: customerBook esAquelLlamado: johnLennon ].
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LMG 10/14/2021 11:57:44'!
test05SuspendedCustomerShouldNotRemoveItFromCustomerBook

	| customerBook estadoEsperadoDelCustomerBook |
	
	customerBook := self enUnCustomerBookNuevoConUnClienteLlamado: paulMcCartney realizar: [:unCliente :registro| 
		registro suspendCustomerNamed: unCliente.
	].
	estadoEsperadoDelCustomerBook := EstadoCustomerBook activos: 0 suspendidos: 1 totales:1.
	
	self assert: (estadoEsperadoDelCustomerBook esIgualAlEstadoDel: customerBook).
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LMG 10/14/2021 11:57:35'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook estadoEsperadoDelCustomerBook |
	
	customerBook := self enUnCustomerBookNuevoConUnClienteLlamado: paulMcCartney realizar:[:unCliente :registro| 
		registro suspendCustomerNamed: unCliente.
		registro removeCustomerNamed: unCliente.
	].	
	estadoEsperadoDelCustomerBook := EstadoCustomerBook activos: 0 suspendidos: 0 totales:0.
	
	self assert: (estadoEsperadoDelCustomerBook esIgualAlEstadoDel: customerBook).
	self deny: (customerBook includesCustomerNamed: paulMcCartney ).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LMG 10/14/2021 16:03:00'!
test07CanNotSuspendAnInvalidCustomernuevo
	
	| customerBook |
	
	customerBook := self crearUnCustomerBookConUnClienteLlamado: johnLennon.
	
	self suspenderAUnClienteInvalidoLlamado: ringoStarr en: customerBook conUnUnicoClienteLlamado: johnLennon.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LMG 10/14/2021 16:03:00'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook |
	
	customerBook := self enUnCustomerBookNuevoConUnClienteLlamado: johnLennon realizar: [:unCliente :registro| 
		registro suspendCustomerNamed: unCliente.
	].
	
	self suspenderAUnClienteInvalidoLlamado: johnLennon en: customerBook conUnUnicoClienteLlamado: johnLennon.
! !


!CustomerBookTest methodsFor: 'tests - privado' stamp: 'LMG 10/13/2021 16:33:51'!
crearUnCustomerBookConUnClienteLlamado: unNombre

	| unCustomerBook |
	
	unCustomerBook := CustomerBook new.
	
	unCustomerBook addCustomerNamed: unNombre.
	^unCustomerBook.

	

	! !

!CustomerBookTest methodsFor: 'tests - privado' stamp: 'LMG 10/13/2021 15:46:23'!
elUnicoClienteEn: unCustomerBook esAquelLlamado: unNombre 
	
	self assert: unCustomerBook numberOfCustomers = 1.
	self assert: (unCustomerBook includesCustomerNamed: unNombre )
! !

!CustomerBookTest methodsFor: 'tests - privado' stamp: 'LMG 10/13/2021 16:22:56'!
enUnCustomerBookNuevoConUnClienteLlamado: unNombre realizar: unaAccion

	| unCustomerBook |
	
	unCustomerBook := self crearUnCustomerBookConUnClienteLlamado: unNombre.	
	
	unaAccion value: unNombre value: unCustomerBook.	
	^unCustomerBook.


	

	! !

!CustomerBookTest methodsFor: 'tests - privado' stamp: 'LMG 10/13/2021 16:00:32'!
intentoEjecutar: unPrimerBloque queDebePresentar: unTipoDeError seEjecuta: unSegundoBloque
	
	[unPrimerBloque value.
	self fail]
		on: unTipoDeError 
		do: unSegundoBloque.
	

! !

!CustomerBookTest methodsFor: 'tests - privado' stamp: 'LMG 10/13/2021 16:24:39'!
seRealiza: unaAccion enMenosDe: unTiempoMaximo

	| tiempoEnMilisegundosAntesDeEjecutar tiempoEnMilisegundosDespuesDeEjectuar |
	
	tiempoEnMilisegundosAntesDeEjecutar := Time millisecondClockValue * millisecond.
	unaAccion value.
	tiempoEnMilisegundosDespuesDeEjectuar := Time millisecondClockValue * millisecond.
	
	^ (tiempoEnMilisegundosDespuesDeEjectuar-tiempoEnMilisegundosAntesDeEjecutar) < (unTiempoMaximo).
	
! !

!CustomerBookTest methodsFor: 'tests - privado' stamp: 'LMG 10/14/2021 16:03:00'!
suspenderAUnClienteInvalidoLlamado: nombreDeUnClienteInvalido en: unCustomerBook conUnUnicoClienteLlamado: nombreDelUnicoCliente

	self intentoEjecutar: [unCustomerBook suspendCustomerNamed: nombreDeUnClienteInvalido.] 
		queDebePresentar: CantSuspend  
		seEjecuta: [self elUnicoClienteEn: unCustomerBook  esAquelLlamado: nombreDelUnicoCliente ].
! !


!CustomerBookTest methodsFor: 'inicializar' stamp: 'LMG 10/14/2021 11:58:48'!
setUp

	johnLennon := 'John Lennon'.
	paulMcCartney  := 'Paul McCarteney'.
	ringoStarr := 'Ringo Starr'.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'MGD 10/10/2021 20:29:04'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName. ! !

!CustomerBook methodsFor: 'customer management' stamp: 'LMG 10/13/2021 16:09:05'!
removeCustomerNamed: aName 

	^active remove: aName ifAbsent: [
		 ^suspended remove: aName ifAbsent: [
			^NotFound signal.
		]
	]
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'MGD 10/11/2021 12:55:45'!
numberOfCustomers
	
	^(self numberOfActiveCustomers) + (self numberOfSuspendedCustomers).
	! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'LMG 10/12/2021 20:06:04'!
enviarSeñalDeErrorCon: unMensajeDeError

	self error: unMensajeDeError.! !

!CustomerBook methodsFor: 'signal errors' stamp: 'MGD 10/11/2021 11:08:05'!
signalCustomerAlreadyExists 

	self enviarSeñalDeErrorCon: (self class customerAlreadyExistsErrorMessage).! !

!CustomerBook methodsFor: 'signal errors' stamp: 'MGD 10/11/2021 11:08:05'!
signalCustomerNameCannotBeEmpty 
 
	self enviarSeñalDeErrorCon: (self class customerCanNotBeEmptyErrorMessage).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!classDefinition: #EstadoCustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #EstadoCustomerBook
	instanceVariableNames: 'cantidadClientesActivos cantidadClientesSuspendidos cantidadClientesTotal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!EstadoCustomerBook methodsFor: 'privado' stamp: 'LMG 10/13/2021 16:26:47'!
esIgualAl: estadoDeUnCustomerBook

	^( (cantidadClientesActivos = estadoDeUnCustomerBook informarCantidadClientesActivos) & 
	    (cantidadClientesSuspendidos = estadoDeUnCustomerBook informarCantidadClientesSuspendidos) &
	    (cantidadClientesTotal = estadoDeUnCustomerBook informarCantidadClientesTotales) ).
	! !

!EstadoCustomerBook methodsFor: 'privado' stamp: 'LMG 10/13/2021 16:27:13'!
inicializarConActivos: cantidadActivos suspendidos: cantidadSuspendidos totales: cantidadTotal.

	cantidadClientesActivos := cantidadActivos.
	cantidadClientesSuspendidos := cantidadSuspendidos.
	cantidadClientesTotal := cantidadTotal.! !


!EstadoCustomerBook methodsFor: 'publico' stamp: 'LMG 10/13/2021 16:21:39'!
esIgualAlEstadoDel: unCustomerBook

	| estadoActualDeUnCustomerBook |
	
	estadoActualDeUnCustomerBook := EstadoCustomerBook activos:  (unCustomerBook numberOfActiveCustomers) 
								       				      suspendidos: (unCustomerBook numberOfSuspendedCustomers) 
								       				      totales: (unCustomerBook numberOfCustomers).
	^self esIgualAl: estadoActualDeUnCustomerBook.
	! !

!EstadoCustomerBook methodsFor: 'publico' stamp: 'LMG 10/14/2021 15:54:13'!
informarCantidadClientesActivos

	^ cantidadClientesActivos.
	! !

!EstadoCustomerBook methodsFor: 'publico' stamp: 'LMG 10/14/2021 15:54:15'!
informarCantidadClientesSuspendidos

	^ cantidadClientesSuspendidos .
	! !

!EstadoCustomerBook methodsFor: 'publico' stamp: 'LMG 10/14/2021 15:54:19'!
informarCantidadClientesTotales

	^ cantidadClientesTotal.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoCustomerBook class' category: 'CodigoRepetido-Ejercicio'!
EstadoCustomerBook class
	instanceVariableNames: ''!

!EstadoCustomerBook class methodsFor: 'as yet unclassified' stamp: 'LMG 10/13/2021 14:48:24'!
activos: cantidadActivos suspendidos: cantidadSuspendidos totales: cantidadTotal

	^EstadoCustomerBook new inicializarConActivos: cantidadActivos suspendidos: cantidadSuspendidos totales: cantidadTotal.
	! !
