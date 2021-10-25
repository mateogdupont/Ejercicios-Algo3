!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'LMG 10/22/2021 18:01:48'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].
		
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'arithmetic operatios - private' stamp: 'LMG 10/22/2021 19:35:31'!
beAddedToAFraccion: anAugend
	
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operatios - private' stamp: 'LMG 10/22/2021 19:35:40'!
beAddedToAnEntero: anAugend
	
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operatios - private' stamp: 'LMG 10/22/2021 19:35:58'!
beSubstractedFromAFraccion: aMinuend
	
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operatios - private' stamp: 'LMG 10/22/2021 19:36:04'!
beSubstractedFromAnEntero: aMinuend
	
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operatios - private' stamp: 'LMG 10/22/2021 19:37:18'!
divideAFraccion: aDividend
	
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operatios - private' stamp: 'LMG 10/22/2021 19:37:23'!
divideAnEntero: aDividend
	
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operatios - private' stamp: 'LMG 10/22/2021 19:37:59'!
multiplyAFraccion: aMultiplicand
	
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operatios - private' stamp: 'LMG 10/22/2021 19:37:46'!
multiplyAnEntero: aMultiplicand
	
	self subclassResponsibility.! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'LMG 10/23/2021 11:58:48'!
canNotDivideByZeroErrorDescription

	^ 'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'LMG 10/22/2021 10:51:20'!
invalidNumberTypeErrorDescription

	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'arithmetic operations' stamp: 'LMG 10/22/2021 19:33:51'!
* aMultiplier 
	
	^aMultiplier multiplyAnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LMG 10/22/2021 19:32:45'!
+ anAdder 

	^anAdder beAddedToAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LMG 10/22/2021 19:32:49'!
- aSubtrahend 
	
	^aSubtrahend beSubstractedFromAnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LMG 10/22/2021 19:33:10'!
/ aDivisor 
	
	^aDivisor divideAnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LMG 10/23/2021 11:15:03'!
fibonacci

	self subclassResponsibility.
		! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 12:05:45'!
// aDivisor 
	
	^Entero with: self integerValue // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/25/2021 09:29:34'!
beAddedToAFraccion: anAugend
	
	| newDenominator newNumerator |
	
	newNumerator := anAugend numerator + (self * anAugend denominator) .
	newDenominator := anAugend denominator.
	
	^ newNumerator / newDenominator.
	
! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/22/2021 19:30:44'!
beAddedToAnEntero: anAugend

	^ Entero with: anAugend integerValue + self integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/22/2021 19:30:55'!
beSubstractedFromAFraccion: aMinuend
	
	| newDenominator newNumerator |
	
	newNumerator := aMinuend numerator - (self * aMinuend denominator)  .
	newDenominator := aMinuend denominator.
	
	^ newNumerator / newDenominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/22/2021 19:31:04'!
beSubstractedFromAnEntero: aMinuend

	^Entero with: aMinuend integerValue - self integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/25/2021 09:16:53'!
divideAFraccion: aDividend
	
	| newDenominator newNumerator |
	
	newNumerator := aDividend numerator.
	newDenominator := aDividend denominator * self.

	^ newNumerator / newDenominator.
	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/22/2021 19:33:10'!
divideAnEntero: aDividend

	^Fraccion with: aDividend over: self.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 12:07:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (self integerValue gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/22/2021 19:33:30'!
multiplyAFraccion: aMultiplicand

	| newDenominator newNumerator |
	
	newNumerator := aMultiplicand numerator * self.
	newDenominator := aMultiplicand denominator.

	^ newNumerator / newDenominator.
	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/22/2021 19:33:51'!
multiplyAnEntero: aMultiplicand

	^Entero with: (aMultiplicand integerValue * self integerValue).! !


!Entero methodsFor: 'comparing' stamp: 'LMG 10/25/2021 09:15:02'!
= anObject

	^(anObject isKindOf: Entero) and: [ self integerValue = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'LMG 10/22/2021 18:34:06'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'LMG 10/22/2021 18:33:03'!
isNegative
	
	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'LMG 10/23/2021 11:16:04'!
isOne
	
	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'LMG 10/22/2021 19:56:25'!
isZero
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'LMG 10/23/2021 11:59:55'!
negativeFibonacciErrorDescription

	^ 'Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'LMG 10/25/2021 09:40:02'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [self error: 'aValue debe ser anInteger'].
	
	(aValue negative) 	ifTrue: [^EnteroNegativo new initalizeWith: aValue].
	(aValue = 0) ifTrue: [^Cero new initalizeWith: aValue].
	(aValue = 1) ifTrue: [^Uno new initalizeWith: aValue].
	(aValue positive) 	ifTrue: [^EnteroPositivoMayorAUno new initalizeWith: aValue].
	! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'arithmetic operations' stamp: 'LMG 10/22/2021 19:53:42'!
fibonacci

	^Entero with: 1.! !


!Cero methodsFor: 'testing' stamp: 'LMG 10/23/2021 11:57:39'!
isNegative

	^false.! !

!Cero methodsFor: 'testing' stamp: 'LMG 10/23/2021 11:57:36'!
isOne

	^false.! !

!Cero methodsFor: 'testing' stamp: 'LMG 10/22/2021 19:56:36'!
isZero
	
	^true.! !


!Cero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 11:30:35'!
beDividedBy: aDivisor

	^self! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 11:45:07'!
createAFraccionWith: aNumerator
	
	self error: Fraccion canNotDivideByZeroErrorDescription! !

!Cero methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 11:44:59'!
createASimplifiedFraccionWith: aDividend

	^self createAFraccionWith: aDividend.! !


!classDefinition: #EnteroNegativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroNegativo methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 11:41:05'!
beDividedBy: aDivisor

	^aDivisor createASimplifiedFraccionWith: self.! !

!EnteroNegativo methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 11:57:09'!
createAFraccionWith: aNumerator
	
	self error: Fraccion aFraccionShouldNotHaveANegativeDenominator.! !

!EnteroNegativo methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 11:41:05'!
createASimplifiedFraccionWith: aDividend

	^aDividend negated / self negated! !


!EnteroNegativo methodsFor: 'testing' stamp: 'LMG 10/23/2021 11:57:23'!
isNegative

	^true.! !

!EnteroNegativo methodsFor: 'testing' stamp: 'LMG 10/23/2021 11:57:19'!
isOne

	^false.! !

!EnteroNegativo methodsFor: 'testing' stamp: 'LMG 10/22/2021 19:56:48'!
isZero
	
	^false.! !


!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'LMG 10/22/2021 18:45:17'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription.
		! !


!classDefinition: #EnteroPositivoMayorAUno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroPositivoMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroPositivoMayorAUno methodsFor: 'arithmetic operations' stamp: 'LMG 10/23/2021 09:53:12'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.	
		
	^ (self - one) fibonacci + (self - two) fibonacci
		! !


!EnteroPositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 11:41:05'!
beDividedBy: aDivisor

	^aDivisor createASimplifiedFraccionWith: self.! !

!EnteroPositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 11:06:39'!
createAFraccionWith: aNumerator
	
	^Fraccion new initializeWith: aNumerator over: self.! !

!EnteroPositivoMayorAUno methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 11:41:09'!
createASimplifiedFraccionWith: aDividend

	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: self. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	
	^denominator createAFraccionWith: numerator.! !


!EnteroPositivoMayorAUno methodsFor: 'testing' stamp: 'LMG 10/22/2021 18:33:44'!
isNegative

	^false! !

!EnteroPositivoMayorAUno methodsFor: 'testing' stamp: 'LMG 10/23/2021 11:41:22'!
isOne

	^false.! !

!EnteroPositivoMayorAUno methodsFor: 'testing' stamp: 'LMG 10/22/2021 19:56:59'!
isZero
	
	^false.! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'arithmetic operations' stamp: 'LMG 10/23/2021 09:52:45'!
fibonacci

	^self.! !


!Uno methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 11:41:05'!
beDividedBy: aDivisor

	^aDivisor createASimplifiedFraccionWith: self.! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 11:06:06'!
createAFraccionWith: aNumerator
	
	^aNumerator ! !

!Uno methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/23/2021 11:41:05'!
createASimplifiedFraccionWith: aDividend

	| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: self. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	
	^denominator createAFraccionWith: numerator.! !


!Uno methodsFor: 'testing' stamp: 'LMG 10/23/2021 12:16:13'!
isNegative

	^false! !

!Uno methodsFor: 'testing' stamp: 'LMG 10/23/2021 11:17:18'!
isOne

	^true! !

!Uno methodsFor: 'testing' stamp: 'LMG 10/23/2021 11:17:23'!
isZero

	^false! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'LMG 10/22/2021 19:33:30'!
* aMultiplier 
		
	^aMultiplier multiplyAFraccion: self.

	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LMG 10/22/2021 19:30:28'!
+ anAdder 
	
	^anAdder beAddedToAFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LMG 10/22/2021 19:30:55'!
- aSubtrahend 
	
	^aSubtrahend beSubstractedFromAFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LMG 10/22/2021 19:32:06'!
/ aDivisor 
	
	^aDivisor divideAFraccion: self.
	
	! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/22/2021 19:30:28'!
beAddedToAFraccion: anAugend

	| newDenominator newNumerator |
	
	newNumerator := (anAugend numerator * self denominator) + (self numerator * anAugend denominator).
	newDenominator := anAugend denominator * self denominator.
	
	^ newNumerator / newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/25/2021 09:41:56'!
beAddedToAnEntero: anAugend
	
	| newDenominator newNumerator |
	
	newNumerator := (anAugend * self denominator) + self numerator.
	newDenominator := self denominator.
	
	^ newNumerator / newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/22/2021 19:30:55'!
beSubstractedFromAFraccion: aMinuend

	| newDenominator newNumerator |
	
	newNumerator := (aMinuend numerator * self denominator) - (self numerator * aMinuend denominator).
	newDenominator := aMinuend denominator * self denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/22/2021 19:31:04'!
beSubstractedFromAnEntero: aMinuend

	| newDenominator newNumerator |
	
	newNumerator := (aMinuend * self denominator) - self numerator.
	newDenominator := self denominator.
	
	^ newNumerator / newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/22/2021 19:32:06'!
divideAFraccion: aDividend
	
	| newDenominator newNumerator |
	
	newNumerator := aDividend numerator * self denominator.
	newDenominator := aDividend denominator * self numerator.
	
	^ newNumerator / newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/22/2021 19:33:10'!
divideAnEntero: aDividend

	| newDenominator newNumerator |
	
	newNumerator := aDividend * self denominator.
	newDenominator := self numerator.
	
	^ newNumerator / newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/22/2021 19:33:30'!
multiplyAFraccion: aMultiplicand
	
	| newDenominator newNumerator |
	
	newNumerator := aMultiplicand numerator * self numerator.
	newDenominator := aMultiplicand denominator * self denominator.
	
	^ newNumerator / newDenominator.	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'LMG 10/25/2021 09:42:06'!
multiplyAnEntero: aMultiplicand
	
	| newDenominator newNumerator |
	
	newNumerator := aMultiplicand * self numerator.
	newDenominator := self denominator.
	
	^ newNumerator / newDenominator.	! !


!Fraccion methodsFor: 'comparing' stamp: 'LMG 10/22/2021 14:02:37'!
= anObject

	^(anObject isKindOf: self class) and: [ (self numerator * anObject denominator) = (self denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'LMG 10/23/2021 12:07:23'!
hash

	^(self numerator hash / self denominator hash) hash! !


!Fraccion methodsFor: 'initialization' stamp: 'LMG 10/23/2021 12:09:49'!
initializeWith: aNumerator over: aDenominator
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'testing' stamp: 'LMG 10/23/2021 12:11:03'!
isNegative
	
	^self numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'LMG 10/23/2021 11:59:13'!
aFraccionShouldNotHaveANegativeDenominator

	^ 'Error al crear una fraccion con denominador negativo.'! !

!Fraccion class methodsFor: 'intance creation' stamp: 'LMG 10/25/2021 09:44:37'!
with: aDividend over: aDivisor

	^aDividend beDividedBy: aDivisor.
		! !
