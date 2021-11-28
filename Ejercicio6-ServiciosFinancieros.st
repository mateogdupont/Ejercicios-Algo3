!classDefinition: #PortfoliosTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfoliosTest
	instanceVariableNames: 'portfolio firstPortfolio secondPortfolio account firstAccount secondAccount thirdPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfoliosTest methodsFor: 'testing - hasRegisteredATransaction' stamp: 'LMG 11/27/2021 15:32:45'!
test04AnEmptyPortfolioShouldNotHaveAnyTransactionRegistered

	| deposit |
	
	deposit := CashierDeposit for: 100 * peso.
		
	self deny: (portfolio hasRegistered: deposit) .! !

!PortfoliosTest methodsFor: 'testing - hasRegisteredATransaction' stamp: 'LMG 11/26/2021 18:42:58'!
test05APortfolioWithOneAccountShouldHaveTheTransactionsOfTheAccountRegistered

	| deposit |
		
	deposit := self makeADepositOf: (100 * peso) on: account beforeAddingItOn: portfolio.	
		
	self assert: (portfolio hasRegistered: deposit).! !

!PortfoliosTest methodsFor: 'testing - hasRegisteredATransaction' stamp: 'LMG 11/26/2021 18:45:34'!
test06APortfolioWithAccountsShouldHaveTheTransactionsOfThemRegistered
"Consideramos importante testear este caso en particular desde una perspectiva de testing y no de TDD, debido a que esta implementacion ya pasaba la prueba al momento de ser creada."

	| withdraw deposit | 
	
	withdraw := self makeAWithdrawOf: (100 * peso) on: firstAccount beforeAddingItOn: portfolio.	
	deposit := self makeADepositOf: (100 * peso) on: secondAccount beforeAddingItOn: portfolio.	
			
	self assert: (portfolio hasRegistered: withdraw).
	self assert: (portfolio hasRegistered: deposit).
	
	! !


!PortfoliosTest methodsFor: 'testing - balance' stamp: 'LMG 11/26/2021 18:26:10'!
test01TheBalanceOfAnEmptyPortfolioShouldBeZeroPesos
	
	self assert: (0 * peso) equals: (portfolio balance).! !

!PortfoliosTest methodsFor: 'testing - balance' stamp: 'LMG 11/26/2021 18:48:19'!
test02TheBalanceOfAPortfolioWithOneAccountShouldBeTheBalanceOfTheAccount
	
	self makeADepositOf: (100 * peso) on: account beforeAddingItOn: portfolio.	
	
	self assert: (100 * peso) equals: (portfolio balance).! !

!PortfoliosTest methodsFor: 'testing - balance' stamp: 'LMG 11/26/2021 18:42:11'!
test03TheBalanceOfAPortfolioWithAccountsShouldBeTheBalanceOfTheAccounts
		
	self makeADepositOf: (100 * peso) on: firstAccount beforeAddingItOn: portfolio.	
	self makeADepositOf: (200 * peso) on: secondAccount beforeAddingItOn: portfolio.	
	
	self assert: (300 * peso) equals: (portfolio balance).! !


!PortfoliosTest methodsFor: 'testing - transactions' stamp: 'LMG 11/26/2021 18:26:10'!
test07ThereShouldNotBeTransactionsOnAnEmptyPortfolio
			
	self assert: (portfolio transactions) isEmpty.
	
	! !

!PortfoliosTest methodsFor: 'testing - transactions' stamp: 'LMG 11/26/2021 18:46:18'!
test08TheTransactionsOfAPortfolioWithOneAccountShouldBeTheTransactionsOfTheAccount
	
	| deposit |
	
	deposit := self makeADepositOf: (100 * peso) on: account beforeAddingItOn: portfolio.	
			
	self assert: 1 equals: (portfolio transactions) size.
	self assert: ((portfolio transactions) includes: deposit).
	! !


!PortfoliosTest methodsFor: 'testing - portfolioInAnotherPortfolio' stamp: 'LMG 11/27/2021 15:32:45'!
test09APortfolioWithAnEmptyPortfolioWorksCorrectly
"Consideramos importante testear este caso en particular desde una perspectiva de testing y no de TDD, debido a que esta implementacion ya pasaba la prueba al momento de ser creada."
	| deposit |
	
	deposit := CashierDeposit for: 100 * peso.
	
	firstPortfolio add: secondPortfolio.
	
	self assert: (0 * peso) equals: firstPortfolio balance.
	self deny: (firstPortfolio hasRegistered: deposit).
	self assert: (firstPortfolio transactions) isEmpty.
	! !

!PortfoliosTest methodsFor: 'testing - portfolioInAnotherPortfolio' stamp: 'LMG 11/26/2021 18:48:00'!
test10APortfolioWithPortfoliosAndAccountsWorksCorrectly
"Consideramos importante testear este caso en particular desde una perspectiva de testing y no de TDD, debido a que esta implementacion ya pasaba la prueba al momento de ser creada."
	| deposit withdraw |
	
	deposit := self makeADepositOf: (200 * peso) on: firstAccount beforeAddingItOn: secondPortfolio.	
	withdraw := self makeAWithdrawOf: (100 * peso) on: secondAccount beforeAddingItOn: secondPortfolio.	
	
	firstPortfolio add: secondPortfolio.
	
	self assert: (100 * peso) equals: firstPortfolio balance.
	self assert: (firstPortfolio hasRegistered: deposit).
	self assert: (firstPortfolio hasRegistered: withdraw).	
	self assert: 2 equals: (firstPortfolio transactions) size.
	self assert: ((firstPortfolio transactions) includes: deposit).
	self assert: ((firstPortfolio transactions) includes: withdraw).
	! !


!PortfoliosTest methodsFor: 'private' stamp: 'LMG 11/27/2021 15:32:45'!
makeADepositOf: anAmount on: anAccount beforeAddingItOn: aPortfolio 
	
	| deposit |
	
	deposit := CashierDeposit register: anAmount on: anAccount.	
	aPortfolio add: anAccount.	
	
	^deposit.! !

!PortfoliosTest methodsFor: 'private' stamp: 'LMG 11/27/2021 15:32:55'!
makeAWithdrawOf: anAmount on: anAccount beforeAddingItOn: aPortfolio 
	
	| withdraw |
	
	withdraw := CashierWithdraw register: anAmount on: anAccount.	
	aPortfolio add: anAccount.	
	
	^ withdraw.! !


!PortfoliosTest methodsFor: 'setUp' stamp: 'LMG 11/27/2021 16:20:07'!
setUp
	
	portfolio := Portfolio new.
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	thirdPortfolio := Portfolio new.
		
	account := ReceptiveAccount new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.! !


!PortfoliosTest methodsFor: 'testing - extra' stamp: 'MGD 11/28/2021 19:20:46'!
assertThat: anAccount cannotBeAddedInto: anotherAccount

	self
		should: [anotherAccount add: anAccount.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ : anError |
			self assert: anError messageText = Portfolio accountCannotBeAddedToThePortfolioErrorDescription.
		].! !

!PortfoliosTest methodsFor: 'testing - extra' stamp: 'MGD 11/28/2021 19:22:21'!
test11APortfolioCannotAddAnAccountTwice

	portfolio add: account.
	
	self assertThat: account cannotBeAddedInto: portfolio.! !

!PortfoliosTest methodsFor: 'testing - extra' stamp: 'MGD 11/28/2021 19:21:03'!
test12AMainPortfolioCannotAddAnAccountThatWasAlreadyIncludedInAnotherPortfolioOfTheMainPortfolio

	firstPortfolio add: secondPortfolio.
	secondPortfolio add: account.
	
	self assertThat: account cannotBeAddedInto: firstPortfolio.! !

!PortfoliosTest methodsFor: 'testing - extra' stamp: 'MGD 11/28/2021 19:23:00'!
test13APortfolioCannotBeAddedToItself
	self assertThat: portfolio cannotBeAddedInto: portfolio.
! !

!PortfoliosTest methodsFor: 'testing - extra' stamp: 'MGD 11/28/2021 19:21:39'!
test14APortfolioCannotAddAnotherPortfolioTwice
		
	firstPortfolio add: secondPortfolio.
	self assertThat: secondPortfolio cannotBeAddedInto: firstPortfolio.! !

!PortfoliosTest methodsFor: 'testing - extra' stamp: 'MGD 11/28/2021 19:21:51'!
test15TheFirstPortfolioCannotAddAThirdPortfolioThatIsAlreadyInTheSecondPortfolioThatIsIncludedInTheFirstOne
		
	firstPortfolio add: secondPortfolio.
	secondPortfolio add: thirdPortfolio.	
	
	self assertThat: thirdPortfolio cannotBeAddedInto: firstPortfolio.! !

!PortfoliosTest methodsFor: 'testing - extra' stamp: 'MGD 11/28/2021 19:16:13'!
test16APortfolioKnowsItsMajorsAndMinorsAccounts

	firstPortfolio add: secondPortfolio.
	
	self assert: (firstPortfolio hasACoincidenceWith: secondPortfolio).
	self assert: (secondPortfolio hasACoincidenceInMajorsPortfoliosWith: firstPortfolio).! !

!PortfoliosTest methodsFor: 'testing - extra' stamp: 'MGD 11/28/2021 19:22:16'!
test17AMinorPortfolioCannotAddAnAccountThatIsIncludedInItsMajorPortfolio
	
	firstPortfolio add: account.
	firstPortfolio add: secondPortfolio.
	
	self assertThat: account cannotBeAddedInto: secondPortfolio.! !

!PortfoliosTest methodsFor: 'testing - extra' stamp: 'MGD 11/28/2021 19:22:36'!
test18APortfolioWithAnAccountCannotAddAnotherPorfolioWithTheSameAccount
	
	firstPortfolio add: account.
	secondPortfolio add: account.
	
	self assertThat: secondPortfolio cannotBeAddedInto: firstPortfolio.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'setUp' stamp: 'LMG 11/26/2021 17:42:52'!
setUp

	account := ReceptiveAccount new.! !


!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LMG 11/26/2021 18:00:26'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	self assert: (0 * peso) equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LMG 11/27/2021 15:32:45'!
test02DepositIncreasesBalanceOnTransactionValue 
	
	CashierDeposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LMG 11/27/2021 15:32:55'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	CashierDeposit register: 100 * peso on: account.
	CashierWithdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
	
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LMG 11/27/2021 15:32:55'!
test04WithdrawValueMustBePositive 

	| withdrawValue |
	
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (CashierWithdraw register: withdrawValue on: account) amount
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LMG 11/27/2021 15:32:55'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |
	
	deposit := CashierDeposit register: 100 * peso on: account.
	withdraw := CashierWithdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LMG 11/27/2021 15:32:55'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
		
	deposit := CashierDeposit for: 100 * peso.
	withdraw := CashierWithdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LMG 11/27/2021 15:32:45'!
test07AccountKnowsItsTransactions 

	| deposit |
	
	deposit := CashierDeposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'originAccount destinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'testing - error' stamp: 'LMG 11/26/2021 18:16:19'!
test05TheAmountToTransferShouldNotBeZeroPesos
	self assertThatATransferIsInvalidWith: (0 * peso).! !

!TransferTest methodsFor: 'testing - error' stamp: 'LMG 11/26/2021 18:16:19'!
test06TheAmountToTransferShouldNotBeNegative	
	self assertThatATransferIsInvalidWith: (-1 * peso).! !


!TransferTest methodsFor: 'testing - value' stamp: 'LMG 11/27/2021 15:30:25'!
test02TransferKnowsTheAmountThatWasTransferedFromAnAccountToAnotherAccount

	| transfer |
		
	transfer := Transfer from: originAccount to: destinationAccount for: 100 * peso.
		
	self assert: (100 * peso) equals: (transfer amount).! !


!TransferTest methodsFor: 'testing - balance' stamp: 'LMG 11/26/2021 18:15:47'!
test01TranferFromAnAccountToAnotherAccountLeftBothAccountsWithTheCorrectBalance
		
	Transfer from: originAccount to: destinationAccount for: (100 * peso).
		
	self assert: (-100 * peso) equals: (originAccount balance).
	self assert:  (100 * peso) equals: (destinationAccount balance).		
! !


!TransferTest methodsFor: 'setUp' stamp: 'LMG 11/26/2021 18:15:14'!
setUp

	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.! !


!TransferTest methodsFor: 'private' stamp: 'LMG 11/26/2021 18:16:19'!
assertThatATransferIsInvalidWith: anAmount
		
	self
		should: [Transfer from: originAccount to: destinationAccount for: anAmount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Transfer invalidAmountToTransferErrorDescription.
		].! !


!TransferTest methodsFor: 'testing - legs' stamp: 'LMG 11/26/2021 18:17:54'!
test03TransferDepositLegKnowsItsCounterLeg
	
	| transfer |
		
	transfer := Transfer from: originAccount to: destinationAccount for: 100 * peso.
		
	self assert: (transfer depositLeg) equals: ((transfer withdrawLeg) counterLeg).! !

!TransferTest methodsFor: 'testing - legs' stamp: 'LMG 11/26/2021 18:18:05'!
test04TransferWithdrawLegKnowsItsCounterLeg	
	
	| transfer |
	
	transfer := Transfer from: originAccount to: destinationAccount for: 100 * peso.
		
	self assert: (transfer withdrawLeg) equals: ((transfer depositLeg) counterLeg).! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'public' stamp: 'LMG 11/27/2021 15:30:25'!
amount
	^ amount.! !

!AccountTransaction methodsFor: 'public' stamp: 'LMG 11/26/2021 20:06:08'!
decideHowToDoTheBalanceOf: anAccount
	self subclassResponsibility ! !


!classDefinition: #CashierDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #CashierDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!CashierDeposit methodsFor: 'initialization' stamp: 'LMG 11/27/2021 15:28:52'!
initializeFor: anAmount
	amount := anAmount ! !


!CashierDeposit methodsFor: 'public' stamp: 'LMG 11/27/2021 15:33:09'!
decideHowToDoTheBalanceOf: anAccount
	^anAccount doBalanceWithACashierDepositOf: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CashierDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
CashierDeposit class
	instanceVariableNames: ''!

!CashierDeposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!CashierDeposit class methodsFor: 'instance creation' stamp: 'MGD 11/25/2021 20:46:04'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #CashierWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #CashierWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!CashierWithdraw methodsFor: 'initialization' stamp: 'LMG 11/27/2021 15:28:52'!
initializeFor: anAmount
	amount := anAmount ! !


!CashierWithdraw methodsFor: 'public' stamp: 'LMG 11/27/2021 15:33:17'!
decideHowToDoTheBalanceOf: anAccount
	^anAccount doBalanceWithACashierWithdrawOf: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CashierWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
CashierWithdraw class
	instanceVariableNames: ''!

!CashierWithdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!CashierWithdraw class methodsFor: 'instance creation' stamp: 'MGD 11/25/2021 20:46:10'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDepositLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDepositLeg methodsFor: 'initialization' stamp: 'LMG 11/27/2021 15:28:52'!
initializeFor: anAmount of: aTransfer
	amount := anAmount.
	transfer := aTransfer.! !


!TransferDepositLeg methodsFor: 'public' stamp: 'MGD 11/25/2021 20:35:30'!
counterLeg
	^transfer withdrawLeg.! !

!TransferDepositLeg methodsFor: 'public' stamp: 'MGD 11/25/2021 20:26:20'!
decideHowToDoTheBalanceOf: anAccount
	^anAccount doBalanceWithATransferDepositLegOf: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDepositLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDepositLeg class
	instanceVariableNames: ''!

!TransferDepositLeg class methodsFor: 'instance creation' stamp: 'LMG 11/27/2021 15:26:44'!
for: anAmount of: aTransfer 
	^ self new initializeFor: anAmount of: aTransfer.! !

!TransferDepositLeg class methodsFor: 'instance creation' stamp: 'LMG 11/27/2021 15:26:52'!
register: anAmount on: account of: aTransfer

	| transaction |
	
	transaction := self for: anAmount of: aTransfer.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdrawLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdrawLeg methodsFor: 'initialization' stamp: 'LMG 11/27/2021 15:28:52'!
initializeFor: anAmount of: aTransfer
	amount := anAmount.
	transfer := aTransfer.! !


!TransferWithdrawLeg methodsFor: 'public' stamp: 'MGD 11/25/2021 20:34:28'!
counterLeg
	^transfer depositLeg.! !

!TransferWithdrawLeg methodsFor: 'public' stamp: 'MGD 11/25/2021 20:26:20'!
decideHowToDoTheBalanceOf: anAccount
	^anAccount doBalanceWithATransferWithdrawLegOf: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdrawLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdrawLeg class
	instanceVariableNames: ''!

!TransferWithdrawLeg class methodsFor: 'instance creation' stamp: 'MGD 11/25/2021 20:39:08'!
for: aValue of: aTransfer 
	^ self new initializeFor: aValue of: aTransfer.! !

!TransferWithdrawLeg class methodsFor: 'instance creation' stamp: 'MGD 11/25/2021 20:44:19'!
register: aValue on: account of: aTransfer

	| transaction |
	
	transaction := self for: aValue of: aTransfer.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'minorsAccounts majorsAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'transactions' stamp: 'LMG 11/26/2021 16:57:06'!
hasRegistered: aTransaction
	^(self transactions) includes: aTransaction.
		! !

!Portfolio methodsFor: 'transactions' stamp: 'MGD 11/28/2021 19:26:34'!
transactions

	| transactions |
	
	transactions := OrderedCollection new.		
	minorsAccounts do: [ :anAccount | 		transactions addAll: 	(anAccount transactions).	].	
	
	^transactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'LMG 11/27/2021 20:59:59'!
initialize

	minorsAccounts := OrderedCollection new.
	majorsAccounts := OrderedCollection new.! !


!Portfolio methodsFor: 'accountsOperations' stamp: 'MGD 11/28/2021 19:13:44'!
add: anAccount

	(self itsFamilyContains: anAccount) ifTrue: [	self error: Portfolio accountCannotBeAddedToThePortfolioErrorDescription.	].				
	self addAFamilyMember: anAccount.
! !

!Portfolio methodsFor: 'accountsOperations' stamp: 'MGD 11/28/2021 19:13:36'!
addAFamilyMember: anAccount

	minorsAccounts add: anAccount.
	(anAccount isKindOf: Portfolio) ifTrue: [anAccount addMajorAccount: self].
! !

!Portfolio methodsFor: 'accountsOperations' stamp: 'LMG 11/27/2021 19:48:18'!
addMajorAccount: anAccount
	majorsAccounts add: anAccount.! !


!Portfolio methodsFor: 'balance' stamp: 'LMG 11/27/2021 19:25:51'!
balance
	^minorsAccounts sum: [: anAccount | anAccount balance] ifEmpty: [^ (0 * peso)].! !


!Portfolio methodsFor: 'testing' stamp: 'MGD 11/28/2021 19:09:09'!
hasACoincidenceInMajorsPortfoliosWith: anAccount

	^(majorsAccounts anySatisfy: [: selectedAccount | 
		selectedAccount itsFamilyContains: anAccount.
	]).
	! !

!Portfolio methodsFor: 'testing' stamp: 'MGD 11/28/2021 19:05:43'!
hasACoincidenceWith: anAccount

	^(minorsAccounts anySatisfy: [: selectedAccount | 
		(selectedAccount hasACoincidenceWith: anAccount) or: [anAccount hasACoincidenceWith: selectedAccount]	
	]) or: [self = anAccount].! !

!Portfolio methodsFor: 'testing' stamp: 'MGD 11/28/2021 20:08:53'!
itsFamilyContains: anAccount
	^(self hasACoincidenceWith: anAccount) or: [self hasACoincidenceInMajorsPortfoliosWith: anAccount]. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'errorsDescription' stamp: 'LMG 11/27/2021 16:11:42'!
accountCannotBeAddedToThePortfolioErrorDescription
	^'This account cannot be added to the portfolio.'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'LMG 11/27/2021 15:14:12'!
initialize
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'LMG 11/26/2021 20:14:14'!
balance
	^ transactions sum: [ :aTransaction | 		aTransaction decideHowToDoTheBalanceOf: self.	] ifEmpty: [ 0 * peso ]! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'LMG 11/27/2021 15:33:09'!
doBalanceWithACashierDepositOf: anAccountTransaction
	^anAccountTransaction amount.! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'LMG 11/27/2021 15:33:17'!
doBalanceWithACashierWithdrawOf: anAccountTransaction
	^anAccountTransaction amount negated.! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'LMG 11/27/2021 15:30:25'!
doBalanceWithATransferDepositLegOf: anAccountTransaction
	^anAccountTransaction amount.! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'LMG 11/27/2021 15:30:25'!
doBalanceWithATransferWithdrawLegOf: anAccountTransaction
	^anAccountTransaction amount negated.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'MGD 11/28/2021 19:25:32'!
hasRegistered: aTransaction
	^ transactions includes: aTransaction. 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'MGD 11/28/2021 19:25:46'!
register: aTransaction
	transactions add: aTransaction.
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'MGD 11/28/2021 19:25:50'!
transactions 
	^ transactions copy.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'MGD 11/28/2021 19:05:42'!
hasACoincidenceWith: anAccount
	^ (self = anAccount).! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'amount depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'LMG 11/26/2021 15:53:37'!
initializeFrom: anOriginAccount to: aDestinationAccount for: anAmountToTransfer 

	amount := anAmountToTransfer.
	withdrawLeg := TransferWithdrawLeg register: anAmountToTransfer on: anOriginAccount of: self.
	depositLeg := TransferDepositLeg register: anAmountToTransfer on: aDestinationAccount of: self.
		! !


!Transfer methodsFor: 'legs' stamp: 'MGD 11/25/2021 20:29:30'!
depositLeg
	^ depositLeg.! !

!Transfer methodsFor: 'legs' stamp: 'MGD 11/25/2021 20:30:07'!
withdrawLeg
	^ withdrawLeg.! !


!Transfer methodsFor: 'value' stamp: 'LMG 11/27/2021 15:30:25'!
amount
	^ amount.
		! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errorsDescription' stamp: 'LMG 11/26/2021 16:01:29'!
invalidAmountToTransferErrorDescription
	^'The amount to transfer is invalid.'! !


!Transfer class methodsFor: 'instance creation' stamp: 'LMG 11/26/2021 16:02:30'!
from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer

	(anAmountToTransfer <= 0) ifTrue: [self error: Transfer invalidAmountToTransferErrorDescription].
 	^ self new initializeFrom: anOriginAccount to: aDestinationAccount for: anAmountToTransfer.! !
