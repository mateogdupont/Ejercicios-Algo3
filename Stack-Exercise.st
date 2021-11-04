!classDefinition: #OOLimitedStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOLimitedStackTest
	instanceVariableNames: 'fullStack stackWithACapacityOfFiveObjects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStackTest methodsFor: 'setUp' stamp: 'LMG 11/4/2021 17:42:00'!
setUp
	
	stackWithACapacityOfFiveObjects := OOLimitedStack with: 5.
	fullStack := OOLimitedStack with: 5. 	
	fullStack push: 'FirstObject'.
	fullStack push: 'SecondObject'.
	fullStack push: 'ThirdObject'.
	fullStack push: 'FourthObject'.
	fullStack push: 'FifthObject'.! !


!OOLimitedStackTest methodsFor: 'test' stamp: 'LMG 11/4/2021 17:04:15'!
test01StackShouldNotBeCreatedWithANegativeCapacity

	self
		should: [OOLimitedStack with: -1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackInvalidCapacityErrorDescription.]! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'LMG 11/4/2021 17:04:08'!
test02StackShouldNotBeCreatedWithAnCeroCapacity

	self
		should: [OOLimitedStack with: 0]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackInvalidCapacityErrorDescription.]! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'LMG 11/4/2021 17:42:00'!
test03StackShouldBeEmptyWhenCreated

	self assert: stackWithACapacityOfFiveObjects isEmpty.
	
	
! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'LMG 11/4/2021 17:42:00'!
test04ObjectsCanBePushedIntoAStackWithAValidCapacity

	stackWithACapacityOfFiveObjects push: 'FirstObject'.
	stackWithACapacityOfFiveObjects  push: 'SecondObject'.
	
	self deny: stackWithACapacityOfFiveObjects isEmpty.
	self assert: 2 equals: stackWithACapacityOfFiveObjects size.! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'LMG 11/4/2021 17:38:55'!
test05StackWithAValidCapacityCanBeFull
	
	self deny: fullStack isEmpty.
	self assert: 5 equals: fullStack size.
	self assert: fullStack isFull.! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'LMG 11/4/2021 17:39:33'!
test06AnObjectCanNotBePushedIntoAStackWithAValidCapacity

	self
		should: [fullStack push: 'SixthObject'.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackFullErrorDescription.]
	! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'LMG 11/4/2021 17:39:54'!
test07AFullStackRemainsInTheSameOrderAfterTryingToPushAnObject
	
	self
		should: [fullStack push: 'SixthObject'.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: fullStack isFull.
			self assert: 'FifthObject' equals: fullStack pop.
			self assert: 'FourthObject' equals: fullStack pop.
			self assert: 'ThirdObject' equals: fullStack pop.
			self assert: 'SecondObject' equals: fullStack pop.
			self assert: 'FirstObject' equals: fullStack pop.
		]
		
		
		
		
		! !


!classDefinition: #OOUnlimitedStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOUnlimitedStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'LMG 11/3/2021 20:29:42'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOUnlimitedStack new.
	
	self assert: stack isEmpty! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'LMG 11/3/2021 20:29:42'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOUnlimitedStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'LMG 11/3/2021 20:29:42'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOUnlimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'LMG 11/3/2021 20:29:42'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOUnlimitedStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'LMG 11/3/2021 20:29:42'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOUnlimitedStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'LMG 11/3/2021 20:29:42'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOUnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'LMG 11/3/2021 20:29:42'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOUnlimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'LMG 11/3/2021 20:29:42'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOUnlimitedStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOUnlimitedStack stackEmptyErrorDescription ]
		
! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'LMG 11/3/2021 20:29:42'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOUnlimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOUnlimitedStack stackEmptyErrorDescription ]
		
! !

!OOUnlimitedStackTest methodsFor: 'test' stamp: 'LMG 11/3/2021 20:29:42'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOUnlimitedStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOUnlimitedStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack sentenceFinderByPrefix prefixWint sentencesWithoutAnyCoincidence sentencesWithOneCoincidence sentencesWithThreeCoincidences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'LMG 11/3/2021 20:29:43'!
setUp

	stack := OOUnlimitedStack new.
	sentenceFinderByPrefix := SentenceFinderByPrefix of: stack.
	prefixWint := Prefix with: 'Wint'.
	sentencesWithoutAnyCoincidence := #('Wind is here' 'winter is here' ' Winter is here' 'Winner' 'Win' 'The winds of Winter').
	sentencesWithOneCoincidence := #('Winter is here' 'winter is here' ' Winter is here' 'Winner' 'Win' 'The winds of Winter').	
	sentencesWithThreeCoincidences := #('Winter is here' 'winter is here' ' Winter is here' 'Winter is comming' 'Wint' 'The winds of Winter').	! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LMG 11/3/2021 16:56:43'!
test01SentenceFinderByPrefixShouldHaveTheSameStackAsWhenCreated

	self assert: stack equals: sentenceFinderByPrefix stack.
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LMG 11/4/2021 17:29:20'!
test02SentenceFinderByPrefixShoudNotSearchWithAnEmptyPrefix
	
	sentencesWithThreeCoincidences do: [:aSentence| stack push: aSentence].
	
	self
		should: [sentenceFinderByPrefix find: (Prefix with: '')]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix sentenceFinderByPrefixShouldNotSearchWithAnInvalidPrefixErrorDescription]
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LMG 11/4/2021 17:29:20'!
test03SentenceFinderByPrefixShoudNotSearchWithAPrefixThatContainsASpace

	sentencesWithThreeCoincidences do: [:aSentence| stack push: aSentence].
	
	self
		should: [sentenceFinderByPrefix find: (Prefix with: 'invalidPrefix ')]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix 
sentenceFinderByPrefixShouldNotSearchWithAnInvalidPrefixErrorDescription]
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LMG 11/3/2021 19:06:09'!
test04SentenceFinderByPrefixCouldNotFindASentenceOnAnEmptyStack
	
	| foundedSentences |
	
	foundedSentences := sentenceFinderByPrefix find: prefixWint.			
	self assert: 0 equals: (foundedSentences size).
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LMG 11/3/2021 19:11:58'!
test05SentenceFinderByPrefixCouldNotFindASentenceOnAStackWithIncompatibleSentences
	
	| foundedSentences |
	
	sentencesWithoutAnyCoincidence do: [:aSentence| stack push: aSentence].	
	foundedSentences := sentenceFinderByPrefix find: prefixWint.			
	self assert: 0 equals: (foundedSentences size).
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LMG 11/3/2021 19:06:19'!
test06SentenceFinderByPrefixFindsASentenceOnAStackWithOneSentence
	
	| foundedSentences |
	
	stack push: 'Winter is here'.	
	foundedSentences := sentenceFinderByPrefix find: prefixWint.			
	self assert: 'Winter is here' equals: (foundedSentences at: 1).
	self assert: 1 equals: (foundedSentences size).
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LMG 11/3/2021 19:11:18'!
test07SentenceFinderByPrefixFindsASentenceOnAStackWithSentences

	| foundedSentences |
	
	sentencesWithOneCoincidence do: [:aSentence| stack push: aSentence].	
	foundedSentences := sentenceFinderByPrefix find: prefixWint.		
	self assert: 'Winter is here' equals: (foundedSentences at: 1).
	self assert: 1 equals: (foundedSentences size).
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LMG 11/3/2021 19:11:48'!
test08SentenceFinderByPrefixFindsSentencesOnAStackWithSentences

	| foundedSentences |
	
	sentencesWithThreeCoincidences do: [:aSentence| stack push: aSentence].		
	foundedSentences := sentenceFinderByPrefix find: prefixWint.		
	self assert: 'Wint' equals: (foundedSentences at: 1).
	self assert: 'Winter is comming' equals: (foundedSentences at: 2).
	self assert: 'Winter is here' equals: (foundedSentences at: 3).
	self assert: 3 equals: (foundedSentences size).
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LMG 11/3/2021 19:11:58'!
test09StackWithSentencesRemainsInOrdenAfterNotFindingASentence
	
	sentencesWithoutAnyCoincidence do: [:aSentence| stack push: aSentence].	
	sentenceFinderByPrefix find: prefixWint.		
	sentencesWithoutAnyCoincidence reverseDo: [:aSentence| self assert: aSentence equals: stack pop].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LMG 11/3/2021 19:06:43'!
test10StackWithOneSentenceRemainsInOrdenAfterFindingTheSentence
	
	stack push: 'Winter is here'.		
	sentenceFinderByPrefix find: prefixWint.			
	self assert: 'Winter is here' equals: stack pop.
	
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'LMG 11/3/2021 19:11:48'!
test11StackWithSentencesRemainsInOrdenAfterFindingSentences
		
	sentencesWithThreeCoincidences do: [:aSentence| stack push: aSentence].	
	sentenceFinderByPrefix find: prefixWint.		
	sentencesWithThreeCoincidences reverseDo: [:aSentence| self assert: aSentence equals: stack pop].
	
	
	
	
	! !


!classDefinition: #Capacity category: 'Stack-Exercise'!
Object subclass: #Capacity
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Capacity methodsFor: 'private' stamp: 'LMG 11/4/2021 16:40:12'!
initializeWith: aValue
	
	value := aValue.! !


!Capacity methodsFor: 'public' stamp: 'LMG 11/4/2021 17:00:17'!
usedToCreate: aLimitedStack
	
	self subclassResponsibility.! !

!Capacity methodsFor: 'public' stamp: 'LMG 11/4/2021 16:44:15'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Capacity class' category: 'Stack-Exercise'!
Capacity class
	instanceVariableNames: ''!

!Capacity class methodsFor: 'private' stamp: 'LMG 11/4/2021 16:49:42'!
canInitializeWith: aValue

	self subclassResponsibility.! !


!Capacity class methodsFor: 'instance creation' stamp: 'LMG 11/4/2021 16:30:12'!
with: aValue
	
	| selectedSubclasses |
	
	selectedSubclasses := Capacity subclasses detect: [:subclass | subclass canInitializeWith: aValue].	
	^ selectedSubclasses new initializeWith: aValue .! !


!classDefinition: #InvalidCapacity category: 'Stack-Exercise'!
Capacity subclass: #InvalidCapacity
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!InvalidCapacity methodsFor: 'public' stamp: 'LMG 11/4/2021 17:00:17'!
usedToCreate: aLimitedStack
	
	^aLimitedStack withAnInvalidCapacity: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidCapacity class' category: 'Stack-Exercise'!
InvalidCapacity class
	instanceVariableNames: ''!

!InvalidCapacity class methodsFor: 'private' stamp: 'LMG 11/4/2021 16:38:44'!
canInitializeWith: aValue

	^ aValue <= 0.! !


!classDefinition: #ValidCapacity category: 'Stack-Exercise'!
Capacity subclass: #ValidCapacity
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValidCapacity methodsFor: 'public' stamp: 'LMG 11/4/2021 17:00:17'!
usedToCreate: aLimitedStack
	
	^aLimitedStack withAValidCapacity: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidCapacity class' category: 'Stack-Exercise'!
ValidCapacity class
	instanceVariableNames: ''!

!ValidCapacity class methodsFor: 'private' stamp: 'LMG 11/4/2021 16:31:36'!
canInitializeWith: aValue

	^ aValue > 0.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'content state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 16:10:54'!
popFromANotEmptyNotFullStack

	|anObject|
	
	anObject := content removeFirst.		
	self updateState.
	^anObject.! !

!OOStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 14:32:30'!
popFromAnEmptyStack

	self error: OOStack stackEmptyErrorDescription	.
	! !

!OOStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 15:18:06'!
pushOnANotEmptyNotFullStack: anObject
	
	self subclassResponsibility.
	! !

!OOStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 14:35:27'!
pushOnAnEmptyStack: anObject
		
	self subclassResponsibility.! !

!OOStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 16:10:54'!
topOfANotEmptyNotFullStack
	
	^content at:1.! !

!OOStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 14:32:30'!
topOfAnEmptyStack

	self error: OOStack stackEmptyErrorDescription	.! !


!OOStack methodsFor: 'operations - public' stamp: 'LMG 11/4/2021 16:10:54'!
isEmpty

	^content isEmpty.! !

!OOStack methodsFor: 'operations - public' stamp: 'LMG 11/4/2021 14:30:30'!
pop

	^state decidesHowToPopAnObjectFrom: self.! !

!OOStack methodsFor: 'operations - public' stamp: 'LMG 11/4/2021 14:35:15'!
push: anObject.

	self subclassResponsibility.
	
	
	! !

!OOStack methodsFor: 'operations - public' stamp: 'LMG 11/4/2021 16:10:54'!
size

	^content size.
	! !

!OOStack methodsFor: 'operations - public' stamp: 'LMG 11/4/2021 14:30:30'!
top

	^state decidesHowToTopAnObjectFrom: self.
	
	
	! !


!OOStack methodsFor: 'state' stamp: 'LMG 11/4/2021 16:17:00'!
hasTheSameStateAs: aStateSubclass

	self subclassResponsibility.! !

!OOStack methodsFor: 'state' stamp: 'LMG 11/4/2021 14:30:30'!
updateState
	
	|selectedSubclasses|
	
	selectedSubclasses := StateOfAStack subclasses detect: [:subclass | subclass matchWithTheStateOf: self].	
	state := selectedSubclasses new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error' stamp: 'LMG 11/4/2021 14:31:16'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOLimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOLimitedStack
	instanceVariableNames: 'capacity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 16:10:54'!
popFromAFullStack

	|anObject|
	
	anObject := content removeFirst.		
	self updateState.
	^anObject.! !

!OOLimitedStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 15:15:00'!
pushOnAFullStack: anObject
		
	self error: OOLimitedStack stackFullErrorDescription	.! !

!OOLimitedStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 16:10:55'!
pushOnANotEmptyNotFullStack: anObject
	
	content addFirst: anObject.
	self updateState.
	^anObject.
	! !

!OOLimitedStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 16:10:55'!
pushOnAnEmptyStack: anObject
			
	content addFirst: anObject.
	self updateState.
	^anObject.! !

!OOLimitedStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 16:10:55'!
topOfAFullStack

	^content at:1.! !


!OOLimitedStack methodsFor: 'operations - public' stamp: 'LMG 11/4/2021 15:24:30'!
isFull
	
	^(self size = capacity).! !

!OOLimitedStack methodsFor: 'operations - public' stamp: 'LMG 11/4/2021 14:59:49'!
push: anObject.

	^state of: self decidesHowToPush: anObject.
	
	
	! !


!OOLimitedStack methodsFor: 'state' stamp: 'LMG 11/4/2021 16:45:38'!
hasTheSameStateAs: aStateSubclass
	
	^aStateSubclass matchWithTheStateOfALimitedStack: self.! !


!OOLimitedStack methodsFor: 'initialization' stamp: 'LMG 11/4/2021 16:10:55'!
initializeWith: aCapacity

	content := OrderedCollection new.
	state := StateEmpty new.
	capacity := aCapacity.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: 'Stack-Exercise'!
OOLimitedStack class
	instanceVariableNames: ''!

!OOLimitedStack class methodsFor: 'instance creation - public' stamp: 'LMG 11/4/2021 17:00:17'!
with: aValue
	
	| capacity |
	
	capacity := 	Capacity with: 	aValue.	
	^capacity usedToCreate: self.! !


!OOLimitedStack class methodsFor: 'error' stamp: 'LMG 11/4/2021 15:15:38'!
stackFullErrorDescription
	
	^ 'Stack is full.'! !

!OOLimitedStack class methodsFor: 'error' stamp: 'LMG 11/4/2021 15:30:13'!
stackInvalidCapacityErrorDescription
	
	^ 'The capacity must be a positive integer.'! !


!OOLimitedStack class methodsFor: 'instance creation - private' stamp: 'LMG 11/4/2021 16:43:35'!
withAValidCapacity: aCapacity

	^OOLimitedStack new initializeWith: aCapacity value.! !

!OOLimitedStack class methodsFor: 'instance creation - private' stamp: 'LMG 11/4/2021 16:43:53'!
withAnInvalidCapacity: aCapacity

	self error: OOLimitedStack stackInvalidCapacityErrorDescription.! !


!classDefinition: #OOUnlimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOUnlimitedStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOUnlimitedStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 16:10:55'!
pushOnANotEmptyNotFullStack: anObject
	
	content addFirst: anObject.
	self updateState.
	^anObject.
	! !

!OOUnlimitedStack methodsFor: 'operations - private' stamp: 'LMG 11/4/2021 16:10:55'!
pushOnAnEmptyStack: anObject

	content addFirst: anObject.
	self updateState.
	^anObject.! !


!OOUnlimitedStack methodsFor: 'operations - public' stamp: 'LMG 10/30/2021 17:27:29'!
push: anObject.

	^ state of: self decidesHowToPush: anObject.
	
	
	! !


!OOUnlimitedStack methodsFor: 'state' stamp: 'LMG 11/4/2021 16:45:47'!
hasTheSameStateAs: aStateSubclass
	
	^aStateSubclass matchWithTheStateOfAnUnlimitedStack: self.! !


!OOUnlimitedStack methodsFor: 'initialization' stamp: 'LMG 11/4/2021 16:10:55'!
initialize

	content := OrderedCollection new.
	state := StateEmpty new.! !


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: 'text'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Prefix methodsFor: 'private' stamp: 'LMG 11/4/2021 16:13:08'!
initializeWith: aString
	
	text := aString.! !


!Prefix methodsFor: 'public' stamp: 'LMG 11/4/2021 16:53:22'!
getText

	^text! !

!Prefix methodsFor: 'public' stamp: 'LMG 11/3/2021 18:43:16'!
isSearchedBy: aSentenceFinderByPrefix
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: 'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'private' stamp: 'LMG 11/3/2021 19:22:51'!
canInitializeWith: aString

	self subclassResponsibility.! !


!Prefix class methodsFor: 'instance creation' stamp: 'LMG 11/3/2021 19:22:51'!
with: aString

	| selectedSubclasses |
	
	selectedSubclasses := Prefix subclasses detect: [:subclass | subclass canInitializeWith: aString].	
	^ selectedSubclasses new initializeWith: aString.! !


!classDefinition: #InvalidPrefix category: 'Stack-Exercise'!
Prefix subclass: #InvalidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!InvalidPrefix methodsFor: 'public' stamp: 'LMG 11/3/2021 17:58:35'!
isSearchedBy: aSentenceFinderByPrefix
	
	^aSentenceFinderByPrefix findASentenceWithAnInvalidPrefix: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidPrefix class' category: 'Stack-Exercise'!
InvalidPrefix class
	instanceVariableNames: ''!

!InvalidPrefix class methodsFor: 'private' stamp: 'LMG 11/3/2021 19:22:51'!
canInitializeWith: aString

	^(aString isEmpty) or: [aString includesSubString: ' '].! !


!classDefinition: #ValidPrefix category: 'Stack-Exercise'!
Prefix subclass: #ValidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValidPrefix methodsFor: 'public' stamp: 'LMG 11/3/2021 18:02:49'!
isSearchedBy: aSentenceFinderByPrefix

	^aSentenceFinderByPrefix findASentenceWithAValidPrefix: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidPrefix class' category: 'Stack-Exercise'!
ValidPrefix class
	instanceVariableNames: ''!

!ValidPrefix class methodsFor: 'private' stamp: 'LMG 11/3/2021 19:22:51'!
canInitializeWith: aString

	^((aString isEmpty) or: [aString includesSubString: ' ']) not.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack foundedSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'public' stamp: 'LMG 11/3/2021 18:02:33'!
find: aPrefix	
	
	^aPrefix isSearchedBy: self.	
	
	
	! !

!SentenceFinderByPrefix methodsFor: 'public' stamp: 'LMG 11/3/2021 18:02:23'!
stack

	^stack.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'LMG 11/3/2021 18:30:14'!
initializeWith: aStack

	stack := aStack.
	foundedSentences := OrderedCollection new.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'LMG 11/3/2021 20:29:42'!
findASentenceWithAValidPrefix: aPrefix
	
	|anAuxiliarStack|
	
	anAuxiliarStack := OOUnlimitedStack new.	
	^self findSentencesBeginingWith: aPrefix using: anAuxiliarStack.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'LMG 11/4/2021 17:29:20'!
findASentenceWithAnInvalidPrefix: aPrefix
	
	self error: SentenceFinderByPrefix sentenceFinderByPrefixShouldNotSearchWithAnInvalidPrefixErrorDescription! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'LMG 11/4/2021 16:50:54'!
findSentencesBeginingWith: aPrefix using: anAuxiliarStack 
	
	self popSentencesFrom: stack andPushThemInto: anAuxiliarStack doing: [: popedSentence |		
		(popedSentence beginsWith: aPrefix getText) ifTrue: [foundedSentences add: popedSentence].		
	].

	self popSentencesFrom: anAuxiliarStack andPushThemInto: stack doing: [: popedSentence |	].
	
	^foundedSentences 
	
	
	
	
	
	
	
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'LMG 11/3/2021 15:49:48'!
popASentenceFrom: aStack andPushItInto: anotherStack
		
	| popedSentence |
	
	popedSentence := aStack pop.	
	anotherStack push: popedSentence.
	^popedSentence.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'LMG 11/3/2021 21:22:16'!
popSentencesFrom: aStack andPushThemInto: anotherStack doing: aBlock
	
	| popedSentence |
	
	(aStack size) timesRepeat: [
		popedSentence := self popASentenceFrom: aStack andPushItInto: anotherStack.
		aBlock value: popedSentence.			
	].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'LMG 11/3/2021 19:20:09'!
of: aStack

	^SentenceFinderByPrefix new initializeWith: aStack.
	! !


!SentenceFinderByPrefix class methodsFor: 'error' stamp: 'LMG 11/4/2021 17:29:20'!
sentenceFinderByPrefixShouldNotSearchWithAnInvalidPrefixErrorDescription

	^'The prefix is invalid'! !


!classDefinition: #StateOfAStack category: 'Stack-Exercise'!
Object subclass: #StateOfAStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateOfAStack methodsFor: 'public' stamp: 'LMG 11/4/2021 13:29:18'!
decidesHowToPopAnObjectFrom: aStack

	self subclassResponsibility.! !

!StateOfAStack methodsFor: 'public' stamp: 'LMG 11/4/2021 13:29:21'!
decidesHowToTopAnObjectFrom: aStack

	self subclassResponsibility.! !

!StateOfAStack methodsFor: 'public' stamp: 'LMG 11/4/2021 17:44:35'!
of: aStack decidesHowToPush: anObject

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateOfAStack class' category: 'Stack-Exercise'!
StateOfAStack class
	instanceVariableNames: ''!

!StateOfAStack class methodsFor: 'public' stamp: 'LMG 11/3/2021 17:39:06'!
matchWithTheStateOf: aStack

	self subclassResponsibility.! !


!classDefinition: #StateEmpty category: 'Stack-Exercise'!
StateOfAStack subclass: #StateEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateEmpty methodsFor: 'public' stamp: 'LMG 10/30/2021 17:16:12'!
decidesHowToPopAnObjectFrom: aStack

	^aStack popFromAnEmptyStack.! !

!StateEmpty methodsFor: 'public' stamp: 'LMG 10/30/2021 16:52:43'!
decidesHowToTopAnObjectFrom: aStack
	
	^aStack topOfAnEmptyStack.! !

!StateEmpty methodsFor: 'public' stamp: 'LMG 10/30/2021 16:21:45'!
of: aStack decidesHowToPush: anObject
	
	^aStack pushOnAnEmptyStack: anObject.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateEmpty class' category: 'Stack-Exercise'!
StateEmpty class
	instanceVariableNames: ''!

!StateEmpty class methodsFor: 'public' stamp: 'LMG 11/3/2021 17:39:03'!
matchWithTheStateOf: aStack

	^aStack isEmpty.! !


!classDefinition: #StateFull category: 'Stack-Exercise'!
StateOfAStack subclass: #StateFull
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateFull methodsFor: 'public' stamp: 'LMG 11/4/2021 15:07:18'!
decidesHowToPopAnObjectFrom: aStack

	^aStack popFromAFullStack.! !

!StateFull methodsFor: 'public' stamp: 'LMG 11/4/2021 15:07:26'!
decidesHowToTopAnObjectFrom: aStack
	
	^aStack topOfAFullStack.! !

!StateFull methodsFor: 'public' stamp: 'LMG 11/4/2021 15:07:38'!
of: aStack decidesHowToPush: anObject
	
	^aStack pushOnAFullStack: anObject.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateFull class' category: 'Stack-Exercise'!
StateFull class
	instanceVariableNames: ''!

!StateFull class methodsFor: 'public' stamp: 'LMG 11/4/2021 16:05:03'!
matchWithTheStateOf: aStack

	^aStack hasTheSameStateAs: self.! !

!StateFull class methodsFor: 'public' stamp: 'LMG 11/4/2021 16:45:38'!
matchWithTheStateOfALimitedStack: aStack
	
	^aStack isFull.! !

!StateFull class methodsFor: 'public' stamp: 'LMG 11/4/2021 16:45:47'!
matchWithTheStateOfAnUnlimitedStack: aStack 
	
	^false.! !


!classDefinition: #StateNotEmptyNotFull category: 'Stack-Exercise'!
StateOfAStack subclass: #StateNotEmptyNotFull
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateNotEmptyNotFull methodsFor: 'public' stamp: 'LMG 11/4/2021 15:17:35'!
decidesHowToPopAnObjectFrom: aStack
	
	^aStack popFromANotEmptyNotFullStack.! !

!StateNotEmptyNotFull methodsFor: 'public' stamp: 'LMG 11/4/2021 15:17:52'!
decidesHowToTopAnObjectFrom: aStack
	
	^aStack topOfANotEmptyNotFullStack.! !

!StateNotEmptyNotFull methodsFor: 'public' stamp: 'LMG 11/4/2021 15:18:06'!
of: aStack decidesHowToPush: anObject
	
	aStack pushOnANotEmptyNotFullStack: anObject.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateNotEmptyNotFull class' category: 'Stack-Exercise'!
StateNotEmptyNotFull class
	instanceVariableNames: ''!

!StateNotEmptyNotFull class methodsFor: 'public' stamp: 'LMG 11/4/2021 16:09:29'!
matchWithTheStateOf: aStack
	
	^aStack hasTheSameStateAs: self.! !

!StateNotEmptyNotFull class methodsFor: 'public' stamp: 'LMG 11/4/2021 16:45:38'!
matchWithTheStateOfALimitedStack: aStack 

	^(aStack isEmpty not) and: [aStack isFull not].! !

!StateNotEmptyNotFull class methodsFor: 'public' stamp: 'LMG 11/4/2021 16:45:47'!
matchWithTheStateOfAnUnlimitedStack: aStack 
	
	^aStack isEmpty not! !
