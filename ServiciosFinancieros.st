!classDefinition: #MakerOfReportsTest category: 'ServiciosFinancieros'!
TestCase subclass: #MakerOfReportsTest
	instanceVariableNames: 'account originAccount destinationAccount makerAOfSummary makerOfATransferNet portfolio firstPortfolio secondPortfolio firstAccount secondAccount childrenPortfolio familyPortfolio makerAOfPortfolioTreePrinter fatherAccount firstChildAccount makerAOfPortfolioDetailedTreePrinter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!MakerOfReportsTest methodsFor: 'setUp' stamp: 'MGD 12/6/2021 12:09:11'!
setUp

	account := ReceptiveAccount new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	portfolio := Portfolio new.
	firstPortfolio := Portfolio new.	
	secondPortfolio := Portfolio new.	
	
	makerAOfSummary := MakerOfASummary new.	
	makerOfATransferNet := MakerOfATransferNet new.	
	
	"extra"
	makerAOfPortfolioTreePrinter := MakerOfAPortfolioTreePrinter new.
	makerAOfPortfolioDetailedTreePrinter := MakerOfAPortfolioDetailedTreePrinter new.
	
	familyPortfolio := Portfolio named: 'Portfolio de la familia'.
	childrenPortfolio :=  Portfolio named: 'Portfolio de los hijos'.
	
	fatherAccount := ReceptiveAccount named: 'Cuenta del padre'.
	firstChildAccount := ReceptiveAccount named: 'Cuenta del primer hijo'.
	! !


!MakerOfReportsTest methodsFor: 'testing01 - receptiveAccountSummary' stamp: 'LMG 12/5/2021 17:03:38'!
test01TheSummaryOfANewReceptiveAccountOnlyHasItsBalance	
	self assertThatTheBalanceIsTheOnlyLineInTheSummaryOf: account.

	
	
	

	
	
	! !

!MakerOfReportsTest methodsFor: 'testing01 - receptiveAccountSummary' stamp: 'LMG 12/5/2021 16:47:18'!
test02TheSummaryOfAReceptiveAccountWithADepositHasTheDepositAndItsBalance
	
	Deposit register: (100 * peso) on: account.	
	self assertThatTheSummaryOf: account hasAtFirst: 'Deposito por 100 pesos' andAtLast: 'Balance = 100 pesos'.! !

!MakerOfReportsTest methodsFor: 'testing01 - receptiveAccountSummary' stamp: 'LMG 12/5/2021 16:47:13'!
test03TheSummaryOfAReceptiveAccountWithAWithdrawHasTheWithdrawAndItsBalance	
		
	Withdraw register: (100 * peso) on: account.
	self assertThatTheSummaryOf: account hasAtFirst: 'Extraccion por 100 pesos' andAtLast: 'Balance = -100 pesos'.
	! !

!MakerOfReportsTest methodsFor: 'testing01 - receptiveAccountSummary' stamp: 'LMG 12/5/2021 16:47:09'!
test04TheSummaryOfAReceptiveAccountWithAWithdrawTransferLegHasTheWithdrawTransferLegAndItsBalance

	Transfer amount: (100 * peso) from: originAccount to: destinationAccount.
	self assertThatTheSummaryOf: originAccount hasAtFirst: 'Salida por transferencia de 100 pesos' andAtLast: 'Balance = -100 pesos'.! !

!MakerOfReportsTest methodsFor: 'testing01 - receptiveAccountSummary' stamp: 'LMG 12/5/2021 16:47:05'!
test05TheSummaryOfAReceptiveAccountWithADepositTransferLegHasTheDepositTransferLegAndItsBalance

	Transfer amount: (100 * peso) from: originAccount to: destinationAccount.
	self assertThatTheSummaryOf: destinationAccount hasAtFirst: 'Entrada por transferencia de 100 pesos' andAtLast: 'Balance = 100 pesos'.! !

!MakerOfReportsTest methodsFor: 'testing01 - receptiveAccountSummary' stamp: 'LMG 12/5/2021 16:56:07'!
test06TheSummaryOfAReceptiveAccountWithMoreThanOneTransactionHasAllTheTransactionsAndItsBalance

	Deposit register: (100 * peso) on: account.
	Deposit register: (100 * peso) on: account.
		
	self 
		assertThatTheSummaryOf: account 
		hasAtFirst: 'Deposito por 100 pesos' 
		atSecond: 'Deposito por 100 pesos' 
		andAtLast: 'Balance = 200 pesos'.
	! !


!MakerOfReportsTest methodsFor: 'testing02 - portfolioSummary' stamp: 'LMG 12/5/2021 17:03:38'!
test07TheSummaryOfAnEmptyPortfolioOnlyHasItsBalance
	self assertThatTheBalanceIsTheOnlyLineInTheSummaryOf: portfolio.! !

!MakerOfReportsTest methodsFor: 'testing02 - portfolioSummary' stamp: 'LMG 12/5/2021 16:45:33'!
test08TheSummaryOfAPortfolioWithAReceptiveAccountOnlyHasTheSummaryOfTheReceptiveAccount
	
	Deposit register: (100 * peso) on: account.		
	
	portfolio add: account.
	
	self assertThatTheSummaryOf: portfolio isEqualToTheSummaryOf: account.! !

!MakerOfReportsTest methodsFor: 'testing02 - portfolioSummary' stamp: 'LMG 12/5/2021 16:54:11'!
test09TheSummaryOfAPortfolioWithMoreThanOneReceptiveAccountHasTheirSummary
	
	Deposit register: (50 * peso) on: firstAccount.
	Deposit register: (100 * peso) on: secondAccount.
	
	portfolio add: firstAccount.
	portfolio add: secondAccount.
	
	self 
		assertThatTheSummaryOf: portfolio 
		hasAtFirst: 'Deposito por 50 pesos' 
		atSecond: 'Deposito por 100 pesos' 
		andAtLast: 'Balance = 150 pesos'.! !

!MakerOfReportsTest methodsFor: 'testing02 - portfolioSummary' stamp: 'LMG 12/5/2021 16:45:40'!
test10TheSummaryOfAPortfolioWithAnEmptyPortfolioOnlyHasItsBalance
"Consideramos importante testear este caso en particular desde una perspectiva de testing y no de TDD, debido a que esta implementacion ya pasaba la prueba al momento de ser creada."
	
	firstPortfolio add: secondPortfolio.
	
	self assertThatTheSummaryOf: firstPortfolio isEqualToTheSummaryOf: secondPortfolio.! !

!MakerOfReportsTest methodsFor: 'testing02 - portfolioSummary' stamp: 'LMG 12/5/2021 16:53:18'!
test11TheSummaryOfAPortfolioWithAccountsHasTheCorrectSummary
"Consideramos importante testear este caso en particular desde una perspectiva de testing y no de TDD, debido a que esta implementacion ya pasaba la prueba al momento de ser creada."

	Deposit register: (50 * peso) on: firstAccount.
	Deposit register: (100 * peso) on: secondAccount.	
	
	secondPortfolio add: firstAccount.
	secondPortfolio add: secondAccount.
	firstPortfolio add: secondPortfolio.
	
	self 
		assertThatTheSummaryOf: firstPortfolio 
		hasAtFirst: 'Deposito por 50 pesos' 
		atSecond: 'Deposito por 100 pesos' 
		andAtLast: 'Balance = 150 pesos'.! !


!MakerOfReportsTest methodsFor: 'testing03 - receptiveAccountTransferNet' stamp: 'LMG 12/5/2021 17:27:03'!
test12TheTransferNetOfANewReceptiveAccountIsZeroPesos
	self assertThatTheTransferNetOf: account is: (0 * peso). ! !

!MakerOfReportsTest methodsFor: 'testing03 - receptiveAccountTransferNet' stamp: 'LMG 12/5/2021 17:29:16'!
test13TheTransferNetOfTheReceptiveAccountsThatAreInvolvedInATransferAreCorrect
	
	Transfer amount: (100 * peso) from: originAccount to: destinationAccount.
	
	self assertThatTheTransferNetOf: originAccount is: (-100 * peso). 
	self assertThatTheTransferNetOf: destinationAccount is: (100 * peso). ! !

!MakerOfReportsTest methodsFor: 'testing03 - receptiveAccountTransferNet' stamp: 'LMG 12/5/2021 17:27:59'!
test14TheTransferNetOfAReceptiveAccountWithMoreThanOneTransactionIsOnlyAffectedByATransfer
	
	Deposit register: (100 * peso) on: originAccount.
	Transfer amount: (100 * peso) from: originAccount to: destinationAccount.
	
	self assertThatTheTransferNetOf: originAccount is: (-100 * peso). 
	! !

!MakerOfReportsTest methodsFor: 'testing03 - receptiveAccountTransferNet' stamp: 'LMG 12/5/2021 17:29:48'!
test15TheTransferNetOfTheReceptiveAccountsThatAreInvolvedInMoreThanOneTransferAreCorrect

	Transfer amount: (100 * peso) from: originAccount to: destinationAccount.
	Transfer amount: (100 * peso) from: originAccount to: destinationAccount.
	
	self assertThatTheTransferNetOf: originAccount is: (-200 * peso). 
	self assertThatTheTransferNetOf: destinationAccount is: (200 * peso). ! !


!MakerOfReportsTest methodsFor: 'testing04 - portfolioTransferNet' stamp: 'LMG 12/5/2021 17:27:20'!
test16TheTransferNetOfAnEmptyPortfolioIsZeroPesos
	self assertThatTheTransferNetOf: portfolio is: (0 * peso). ! !

!MakerOfReportsTest methodsFor: 'testing04 - portfolioTransferNet' stamp: 'LMG 12/5/2021 17:23:17'!
test17TheTransferNetOfAPortfolioWithAReceptiveAccountIsTheTransferNetOfTheAccount
	
	Transfer amount: (100 * peso) from: originAccount to: destinationAccount.	
	portfolio add: originAccount.	
	
	self assertThatTheTransferNetOf: portfolio isEqualToTheTransferNetOf: originAccount.! !

!MakerOfReportsTest methodsFor: 'testing04 - portfolioTransferNet' stamp: 'LMG 12/5/2021 17:23:21'!
test18TheTransferNetOfAPortfolioWithMoreThanOneReceptiveAccountIsTheSumOfTheirTransferNet
		
	Transfer amount: (100 * peso) from: originAccount to: destinationAccount.	
	portfolio add: originAccount.	
	portfolio add: destinationAccount.	
	
	self assertThatTheTransferNetOf: portfolio isEqualToTheSumOfTheTransferNetOf: originAccount and: destinationAccount.! !

!MakerOfReportsTest methodsFor: 'testing04 - portfolioTransferNet' stamp: 'LMG 12/5/2021 17:23:26'!
test19TheTransferNetOfAPortfolioWithAccountsIsTheSumOfTheirTransferNet
		
	Transfer amount: (100 * peso) from: originAccount to: destinationAccount.	
	firstPortfolio add: originAccount.	
	secondPortfolio add: destinationAccount.	
	firstPortfolio add: secondPortfolio.
	
	self assertThatTheTransferNetOf: firstPortfolio isEqualToTheSumOfTheTransferNetOf: originAccount and: secondPortfolio.! !


!MakerOfReportsTest methodsFor: 'testing05 - extraPortfolioTreePrinter' stamp: 'MGD 12/6/2021 11:44:19'!
test20ThePortfolioTreeOfAnEmptyFamilyPortfolioOnlyHasItsName
	self assertThatATreeOfAFamilyPortfolioHasTheCorrectFormatWithASizeOf: 1.! !

!MakerOfReportsTest methodsFor: 'testing05 - extraPortfolioTreePrinter' stamp: 'MGD 12/6/2021 11:46:13'!
test21ThePortfolioTreeOfAFamilyPortfolioWithAFatherAccountHasTheirNames
	self 
		assertThatATreeOfAFamilyPortfoliowithOnly: fatherAccount 
		hasTheCorrectFormatWithASecondLine: '    Cuenta del padre'.! !

!MakerOfReportsTest methodsFor: 'testing05 - extraPortfolioTreePrinter' stamp: 'MGD 12/6/2021 11:45:02'!
test22ThePortfolioTreeOfAFamilyPortfolioWithAChildrenPortfolioHasTheirNames
	
	self 
		assertThatATreeOfAFamilyPortfoliowithOnly: childrenPortfolio 
		hasTheCorrectFormatWithASecondLine: '    Portfolio de los hijos'.! !

!MakerOfReportsTest methodsFor: 'testing05 - extraPortfolioTreePrinter' stamp: 'MGD 12/6/2021 11:46:02'!
test23ThePortfolioTreeOfAFamilyPortfolioWithAFatherAccountAndWithAChildrenPortfolioHasTheirNames
		
	familyPortfolio add: childrenPortfolio.
	familyPortfolio add: fatherAccount.
	
	self 
		assertThatTheTreeOfAFamilyPortfolioHasTheCorrectFormaWithASecondLine: '    Portfolio de los hijos' 
		andWithAThirdLine: '    Cuenta del padre'.
! !

!MakerOfReportsTest methodsFor: 'testing05 - extraPortfolioTreePrinter' stamp: 'MGD 12/6/2021 11:47:08'!
test24ThePortfolioTreeOfAFamilyPortfolioWithAChildrenPortfolioThatContainsAChildAccountHasTheirNames
	
	childrenPortfolio add: firstChildAccount.
	familyPortfolio add: childrenPortfolio.
		
	self 
		assertThatTheTreeOfAFamilyPortfolioHasTheCorrectFormaWithASecondLine: '    Portfolio de los hijos' 
		andWithAThirdLine: '        Cuenta del primer hijo'.! !

!MakerOfReportsTest methodsFor: 'testing05 - extraPortfolioTreePrinter' stamp: 'MGD 12/6/2021 11:49:07'!
test25ThePortfolioTreeOfAFamilyPortfolioWithAllTheFamilyMembersHasTheirNames

	| portfolioTree |
	
	familyPortfolio add: fatherAccount.
	childrenPortfolio add: firstChildAccount.
	familyPortfolio add: childrenPortfolio.	
		
	portfolioTree :=  makerAOfPortfolioTreePrinter doOf: familyPortfolio.
	
	self assertThatATreeOfAFamilyPortfolioHasTheCorrectFormatWithASizeOf: 4.
	self assert: '    Cuenta del padre' equals: (portfolioTree at: 2).
	self assert: '    Portfolio de los hijos' equals: (portfolioTree at: 3).
	self assert: '        Cuenta del primer hijo' equals: (portfolioTree at: 4).! !


!MakerOfReportsTest methodsFor: 'testing06 - extraPortfolioDetailedTreePrinter' stamp: 'MGD 12/6/2021 12:09:12'!
test26ThePortfolioDetailedTreeOfAnEmptyFamilyPortfolioOnlyHasItsNameAndItsBalance
	
	| portfolioDetailedTree |
	
	portfolioDetailedTree := makerAOfPortfolioDetailedTreePrinter doOf: familyPortfolio.
	
	self assert: 'Portfolio de la familia' equals: (portfolioDetailedTree at: 1).
	self assert: '    Balance = 0 pesos' equals: (portfolioDetailedTree at: 2).
	self assert: 2 equals: portfolioDetailedTree size.! !

!MakerOfReportsTest methodsFor: 'testing06 - extraPortfolioDetailedTreePrinter' stamp: 'MGD 12/6/2021 12:09:12'!
test27ThePortfolioDetailedTreeOfAFamilyPortfolioWithAFatherAccountHasTheirNamesAndTheirBalance
	
	| portfolioDetailedTree |
	
	familyPortfolio add: fatherAccount.
	
	portfolioDetailedTree := makerAOfPortfolioDetailedTreePrinter doOf: familyPortfolio.
	
	self assert: 'Portfolio de la familia' equals: (portfolioDetailedTree at: 1).
	self assert: '    Cuenta del padre' equals: (portfolioDetailedTree at: 2).
	self assert: '        Balance = 0 pesos' equals: (portfolioDetailedTree at: 3).
	self assert: '    Balance = 0 pesos' equals: (portfolioDetailedTree at: 4).
	self assert: 4 equals: portfolioDetailedTree size.! !

!MakerOfReportsTest methodsFor: 'testing06 - extraPortfolioDetailedTreePrinter' stamp: 'MGD 12/6/2021 12:09:11'!
test28ThePortfolioDetailedTreeOfAFamilyPortfolioWithAFatherAccountHasTheirNamesAndTheirReports
	
	| portfolioDetailedTree |
	
	Deposit register: (100 * peso) on: fatherAccount.
	familyPortfolio add: fatherAccount.
	
	portfolioDetailedTree := makerAOfPortfolioDetailedTreePrinter doOf: familyPortfolio.
	
	self assert: 'Portfolio de la familia' equals: (portfolioDetailedTree at: 1).
	self assert: '    Cuenta del padre' equals: (portfolioDetailedTree at: 2).
	self assert: '        Deposito por 100 pesos' equals: (portfolioDetailedTree at: 3).
	self assert: '        Balance = 100 pesos' equals: (portfolioDetailedTree at: 4).
	self assert: '    Balance = 100 pesos' equals: (portfolioDetailedTree at: 5).
	self assert: 5 equals: portfolioDetailedTree size.! !

!MakerOfReportsTest methodsFor: 'testing06 - extraPortfolioDetailedTreePrinter' stamp: 'MGD 12/6/2021 12:09:11'!
test29ThePortfolioDetailedTreeOfAFamilyPortfolioWithAFatherAccountAndWithAChildrenPortfolioHasTheirNamesAndTheirBalance
	
	| portfolioDetailedTree |
	
	familyPortfolio add: fatherAccount.
	familyPortfolio add: childrenPortfolio. 
	
	portfolioDetailedTree := makerAOfPortfolioDetailedTreePrinter doOf: familyPortfolio.
	
	self assert: 'Portfolio de la familia' equals: (portfolioDetailedTree at: 1).
	self assert: '    Cuenta del padre' equals: (portfolioDetailedTree at: 2).
	self assert: '        Balance = 0 pesos' equals: (portfolioDetailedTree at: 3).
	self assert: '    Portfolio de los hijos' equals: (portfolioDetailedTree at: 4).
	self assert: '        Balance = 0 pesos' equals: (portfolioDetailedTree at: 5).
	self assert: '    Balance = 0 pesos' equals: (portfolioDetailedTree at: 6).
	self assert: 6 equals: portfolioDetailedTree size.! !

!MakerOfReportsTest methodsFor: 'testing06 - extraPortfolioDetailedTreePrinter' stamp: 'MGD 12/6/2021 12:09:12'!
test30ThePortfolioDetailedTreeOfAFamilyPortfolioWithAFatherAccountAndWithAChildrenPortfolioHasTheirNamesAndTheirReport
	
	| portfolioDetailedTree |
	
	Deposit register: (100*peso) on: fatherAccount.
	Deposit register: (50*peso) on: firstChildAccount.
	familyPortfolio add: fatherAccount.
	childrenPortfolio add: firstChildAccount.
	familyPortfolio add: childrenPortfolio.
	
	portfolioDetailedTree := makerAOfPortfolioDetailedTreePrinter doOf: familyPortfolio.
	
	self assert: 'Portfolio de la familia' equals: (portfolioDetailedTree at: 1).
	self assert: '    Cuenta del padre' equals: (portfolioDetailedTree at: 2).
	self assert: '        Deposito por 100 pesos' equals: (portfolioDetailedTree at: 3).
	self assert: '        Balance = 100 pesos' equals: (portfolioDetailedTree at: 4).
	self assert: '    Portfolio de los hijos' equals: (portfolioDetailedTree at: 5).
	self assert: '        Cuenta del primer hijo' equals: (portfolioDetailedTree at: 6).
	self assert: '            Deposito por 50 pesos' equals: (portfolioDetailedTree at: 7).
	self assert: '            Balance = 50 pesos' equals: (portfolioDetailedTree at: 8).
	self assert: '        Balance = 50 pesos' equals: (portfolioDetailedTree at: 9).
	self assert: '    Balance = 150 pesos' equals: (portfolioDetailedTree at: 10).
	self assert: 10 equals: portfolioDetailedTree size.! !


!MakerOfReportsTest methodsFor: 'testing07 - extraErrors' stamp: 'MGD 12/6/2021 12:20:50'!
test30ATreeCanNotBeMadeFromAReceptiveAccount
	self
		should: [makerAOfPortfolioTreePrinter doOf: fatherAccount.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MakerOfATreePrinter aTreeCanNotBeMadeFromAReceptiveAccountErrorDescription.
		].! !

!MakerOfReportsTest methodsFor: 'testing07 - extraErrors' stamp: 'MGD 12/6/2021 12:21:17'!
test31ADetailedTreeCanNotBeMadeFromAReceptiveAccount
	self
		should: [makerAOfPortfolioDetailedTreePrinter doOf: fatherAccount.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MakerOfATreePrinter aTreeCanNotBeMadeFromAReceptiveAccountErrorDescription.
		].! !


!MakerOfReportsTest methodsFor: 'private' stamp: 'MGD 12/6/2021 11:30:06'!
assertThatATreeOfAFamilyPortfolioHasTheCorrectFormatWithASizeOf: aSize

	| portfolioTree |
	
	portfolioTree :=  makerAOfPortfolioTreePrinter doOf: familyPortfolio.
	
	self assert: (portfolioTree includes: 'Portfolio de la familia').
	self assert: aSize equals: (portfolioTree size).! !

!MakerOfReportsTest methodsFor: 'private' stamp: 'MGD 12/6/2021 11:30:41'!
assertThatATreeOfAFamilyPortfoliowithOnly: anAccount hasTheCorrectFormatWithASecondLine: theLineOfTheAccount

	| portfolioTree |
	
	familyPortfolio add: anAccount.
	
	portfolioTree :=  makerAOfPortfolioTreePrinter doOf: familyPortfolio.
	
	self assertThatATreeOfAFamilyPortfolioHasTheCorrectFormatWithASizeOf: 2.
	self assert: theLineOfTheAccount equals: (portfolioTree at: 2).! !

!MakerOfReportsTest methodsFor: 'private' stamp: 'LMG 12/5/2021 17:51:37'!
assertThatAnAmountOfZeroPesosEqualsToTheTransferNetOf: anAccount

	| transferNet |
	
	transferNet := makerOfATransferNet doOf: anAccount.
	
	self assert: (0 * peso) equals: transferNet.! !

!MakerOfReportsTest methodsFor: 'private' stamp: 'LMG 12/5/2021 17:51:30'!
assertThatTheBalanceIsTheOnlyLineInTheSummaryOf: anAccount

	| summary |
	
	summary := makerAOfSummary doOf: anAccount.
	
	self assert: 'Balance = 0 pesos' equals: (summary at: 1).
	self assert: 1 equals: summary size.! !

!MakerOfReportsTest methodsFor: 'private' stamp: 'LMG 12/5/2021 17:51:30'!
assertThatTheSummaryOf: anAccount hasAtFirst: firstLineOfTheSummary andAtLast: BalanceOfTheSummary 

	| summary |
	
	summary := makerAOfSummary doOf: anAccount.
	
	self assert: (summary at: 1) equals: firstLineOfTheSummary.
	self assert: (summary at: 2) equals: BalanceOfTheSummary.
	self assert: 2 equals: summary size.
	! !

!MakerOfReportsTest methodsFor: 'private' stamp: 'LMG 12/5/2021 17:51:30'!
assertThatTheSummaryOf: anAccount hasAtFirst: firstLineOfTheSummary atSecond: secondLineOfTheSummary andAtLast: balanceOfTheSummary 

	| summary |
	
	summary := makerAOfSummary doOf: anAccount.
	
	self assert: (summary at: 1) equals: firstLineOfTheSummary.
	self assert: (summary at: 2) equals: secondLineOfTheSummary.
	self assert: (summary at: 3) equals: balanceOfTheSummary.
	self assert: 3 equals: summary size.
	! !

!MakerOfReportsTest methodsFor: 'private' stamp: 'LMG 12/5/2021 17:51:30'!
assertThatTheSummaryOf: anAccount isEqualToTheSummaryOf: anotherAccount
	
	| summaryOfAnAccount summaryOfAnotherAccount |
	
	summaryOfAnAccount := makerAOfSummary doOf: anAccount.	
	summaryOfAnotherAccount := makerAOfSummary doOf: anotherAccount.	
	
	self assert: summaryOfAnotherAccount equals: summaryOfAnAccount.! !

!MakerOfReportsTest methodsFor: 'private' stamp: 'LMG 12/5/2021 17:51:36'!
assertThatTheTransferNetOf: anAccount is: anAmount

	| accountTransferNet |
	
	accountTransferNet := makerOfATransferNet doOf: anAccount.	
	
	self assert: anAmount equals: accountTransferNet.
	! !

!MakerOfReportsTest methodsFor: 'private' stamp: 'LMG 12/5/2021 17:51:36'!
assertThatTheTransferNetOf: aFirstAccount isEqualToTheSumOfTheTransferNetOf: aSecondAccount and: aThirdAccount 
	
	| firstAccountTransferNet secondAccountTransferNet thirdAccountTransferNet |
	
	firstAccountTransferNet := makerOfATransferNet doOf: aFirstAccount.
	secondAccountTransferNet := makerOfATransferNet doOf: aSecondAccount.
	thirdAccountTransferNet := makerOfATransferNet doOf: aThirdAccount.
	
	self assert: (secondAccountTransferNet + thirdAccountTransferNet) equals: firstAccountTransferNet.! !

!MakerOfReportsTest methodsFor: 'private' stamp: 'LMG 12/5/2021 17:51:37'!
assertThatTheTransferNetOf: aFirstAccount isEqualToTheTransferNetOf: aSecondAccount
	
	| firstAccountTransferNet secondAccountTransferNet |
	
	firstAccountTransferNet := makerOfATransferNet doOf: aFirstAccount.
	secondAccountTransferNet := makerOfATransferNet doOf: aSecondAccount.
	
	self assert: secondAccountTransferNet equals: firstAccountTransferNet.! !

!MakerOfReportsTest methodsFor: 'private' stamp: 'MGD 12/6/2021 11:36:24'!
assertThatTheTreeOfAFamilyPortfolioHasTheCorrectFormaWithASecondLine: aSecondLine andWithAThirdLine: aThirdLine
 
	| portfolioTree |

	portfolioTree :=  makerAOfPortfolioTreePrinter doOf: familyPortfolio.
	
	self assertThatATreeOfAFamilyPortfolioHasTheCorrectFormatWithASizeOf: 3.
	self assert: aSecondLine equals: (portfolioTree at: 2).
	self assert: aThirdLine equals: (portfolioTree at: 3).! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!Account methodsFor: 'main protocol' stamp: 'MGD 12/6/2021 10:39:49'!
acceptVisitor: aMakerOfReports
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'MGD 12/6/2021 11:59:43'!
doOnAccounts: anAction
	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'LMG 12/5/2021 17:41:11'!
doOnTransactions: anAction 
	
	(self transactions) do: [ : aTransaction | anAction value: aTransaction ].! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'LMG 12/5/2021 18:56:03'!
name
	^name! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'initialization' stamp: 'LMG 12/5/2021 18:11:55'!
initializeNamed: anAccountName
	name := anAccountName.! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'as yet unclassified' stamp: 'LMG 12/5/2021 18:08:25'!
named: anAccountName
	^self new initializeNamed: anAccountName.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!Portfolio methodsFor: 'initialization' stamp: 'LMG 12/5/2021 18:04:12'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := 'Default Portfolio Name'.! !


!Portfolio methodsFor: 'main protocol' stamp: 'MGD 12/6/2021 10:38:44'!
acceptVisitor: aMakerOfReports
	^aMakerOfReports visitAPortfolio: self.! !

!Portfolio methodsFor: 'main protocol' stamp: 'LMG 12/1/2021 16:43:45'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'LMG 12/5/2021 18:48:54'!
doOnAccounts: anAction
	accounts do: [ : anAccount | anAction value: anAccount.].! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'LMG 12/5/2021 18:04:22'!
initialize

	super initialize.
	transactions := OrderedCollection new.
	name := 'Default Account Name'.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MGD 12/6/2021 10:39:30'!
acceptVisitor: aMakerOfReports
	^aMakerOfReports visitAReceptiveAccount: self.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LMG 11/29/2021 21:45:31'!
balance

	^transactions 
		inject: (0*peso)
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LMG 12/5/2021 19:45:33'!
doOnAccounts: anAction
	^self! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MGD 12/2/2021 20:58:50'!
transactions 

	^ transactions copy.! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'reports' stamp: 'LMG 12/5/2021 17:32:21'!
acceptVisitor: aMakerOfReports
	self subclassResponsibility.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'reports' stamp: 'LMG 12/5/2021 15:16:02'!
acceptVisitor: aMakerOfReports
	^aMakerOfReports visitADeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'reports' stamp: 'LMG 12/5/2021 15:16:57'!
acceptVisitor: aMakerOfReports
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'reports' stamp: 'LMG 12/5/2021 15:16:45'!
acceptVisitor: aMakerOfReports
	^aMakerOfReports visitATransferDepositLeg: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'reports' stamp: 'LMG 12/5/2021 15:17:10'!
acceptVisitor: aMakerOfReports
	^aMakerOfReports visitATransferWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'reports' stamp: 'LMG 12/5/2021 15:17:27'!
acceptVisitor: aMakerOfReports
	^aMakerOfReports visitAWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #MakerOfReports category: 'ServiciosFinancieros'!
Object subclass: #MakerOfReports
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!MakerOfReports methodsFor: 'main protocol' stamp: 'LMG 12/5/2021 17:34:28'!
doOf: anAccount
	self subclassResponsibility.! !


!classDefinition: #MakerOfASummary category: 'ServiciosFinancieros'!
MakerOfReports subclass: #MakerOfASummary
	instanceVariableNames: 'summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!MakerOfASummary methodsFor: 'main protocol' stamp: 'LMG 12/5/2021 20:11:08'!
doOf: anAccount
	
	summary := OrderedCollection new.
	
	anAccount 		doOnTransactions:[: aTransaction | aTransaction acceptVisitor: self.	].
	summary add: ('Balance = ', (anAccount balance) asString).		
	
	^summary. ! !


!MakerOfASummary methodsFor: 'initialization' stamp: 'LMG 12/5/2021 15:24:44'!
initialize
	summary := OrderedCollection new.! !


!MakerOfASummary methodsFor: 'private' stamp: 'LMG 12/5/2021 15:20:50'!
visitADeposit: aDeposit
	summary add: ('Deposito por ', (aDeposit value) asString).! !

!MakerOfASummary methodsFor: 'private' stamp: 'LMG 12/5/2021 15:21:20'!
visitATransferDepositLeg: aTransferDepositLeg
	summary add: ('Entrada por transferencia de ', (aTransferDepositLeg value) asString).! !

!MakerOfASummary methodsFor: 'private' stamp: 'LMG 12/5/2021 15:21:34'!
visitATransferWithdrawLeg: aTransferWithdrawLeg
	summary add: ('Salida por transferencia de ', (aTransferWithdrawLeg value) asString).! !

!MakerOfASummary methodsFor: 'private' stamp: 'LMG 12/5/2021 15:21:59'!
visitAWithdraw: aWithdraw
	summary add: ('Extraccion por ', (aWithdraw value) asString).! !


!classDefinition: #MakerOfATransferNet category: 'ServiciosFinancieros'!
MakerOfReports subclass: #MakerOfATransferNet
	instanceVariableNames: 'transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!MakerOfATransferNet methodsFor: 'private' stamp: 'LMG 12/5/2021 15:43:46'!
visitADeposit: aDeposit
	^self! !

!MakerOfATransferNet methodsFor: 'private' stamp: 'LMG 12/5/2021 15:44:22'!
visitATransferDepositLeg: aTransferDepositLeg
	transferNet := transferNet + aTransferDepositLeg value.! !

!MakerOfATransferNet methodsFor: 'private' stamp: 'LMG 12/5/2021 15:45:43'!
visitATransferWithdrawLeg: aTransferWithdrawLeg
	transferNet := transferNet - aTransferWithdrawLeg value.! !

!MakerOfATransferNet methodsFor: 'private' stamp: 'LMG 12/5/2021 15:45:35'!
visitAWithdraw: aWithdraw
	^self! !


!MakerOfATransferNet methodsFor: 'main protocol' stamp: 'LMG 12/5/2021 20:11:16'!
doOf: aReceptiveAccount 
	
	transferNet := (0 * peso).
	
	aReceptiveAccount doOnTransactions: [ : aTransaction | aTransaction acceptVisitor: self].
	
	^transferNet.! !


!MakerOfATransferNet methodsFor: 'initialization' stamp: 'LMG 12/5/2021 15:42:06'!
initialize
	transferNet := 0 * peso.! !


!classDefinition: #MakerOfATreePrinter category: 'ServiciosFinancieros'!
MakerOfReports subclass: #MakerOfATreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!MakerOfATreePrinter methodsFor: 'main protocol' stamp: 'MGD 12/6/2021 12:18:19'!
doOf: anAccount

	self assertCanDoATreeOf: anAccount.
	
	^self doATreeOf: anAccount.! !


!MakerOfATreePrinter methodsFor: 'treesCreation' stamp: 'MGD 12/6/2021 10:21:55'!
doATreeWithTheAccountsOf: anAccount

	| aTree |
	
	aTree := OrderedCollection new.	
	
	anAccount doOnAccounts: [ : selectedAccount | 
		aTree addAll: (self doATreeOf: selectedAccount).		
	].
	^aTree.! !


!MakerOfATreePrinter methodsFor: 'errors' stamp: 'MGD 12/6/2021 12:18:10'!
assertCanDoATreeOf: anAccount.
	
	(anAccount isKindOf: Portfolio) 
		ifFalse: [self error: MakerOfATreePrinter aTreeCanNotBeMadeFromAReceptiveAccountErrorDescription].! !


!MakerOfATreePrinter methodsFor: 'treesOperations' stamp: 'MGD 12/6/2021 10:19:21'!
addSpacesToTheAccountsOf: aTree
	
	| auxiliarTree |
	
	auxiliarTree := OrderedCollection new.	
	
	aTree do: [: aNameOfAnAccount | auxiliarTree add: ('    ', aNameOfAnAccount).].
	self copy: auxiliarTree into: aTree.
! !

!MakerOfATreePrinter methodsFor: 'treesOperations' stamp: 'MGD 12/6/2021 10:22:35'!
addTheTreeOfTheAccountsOf: anAccount to: aTree

	| anAccountsTree |
	
	anAccountsTree := self doATreeWithTheAccountsOf: anAccount.
	self addSpacesToTheAccountsOf: anAccountsTree.
	aTree addAll: anAccountsTree.! !

!MakerOfATreePrinter methodsFor: 'treesOperations' stamp: 'MGD 12/6/2021 10:19:38'!
copy: aTree into: anotherTree

	anotherTree removeAll.
	anotherTree addAll: aTree.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MakerOfATreePrinter class' category: 'ServiciosFinancieros'!
MakerOfATreePrinter class
	instanceVariableNames: ''!

!MakerOfATreePrinter class methodsFor: 'errorsDescription' stamp: 'MGD 12/6/2021 12:13:11'!
aTreeCanNotBeMadeFromAReceptiveAccountErrorDescription
	^'A tree can not be made from a receptive account'! !


!classDefinition: #MakerOfAPortfolioDetailedTreePrinter category: 'ServiciosFinancieros'!
MakerOfATreePrinter subclass: #MakerOfAPortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!MakerOfAPortfolioDetailedTreePrinter methodsFor: 'treesCreation' stamp: 'MGD 12/6/2021 10:20:51'!
doATreeOf: anAccount

	| aTree |
	
	aTree := OrderedCollection new.	
	
	aTree add: (anAccount name).		
	self addTheTreeOfTheAccountsOf: anAccount to: aTree.
	self addTheReportOf: anAccount to: aTree.
	
	^aTree.
	! !


!MakerOfAPortfolioDetailedTreePrinter methodsFor: 'reports' stamp: 'MGD 12/6/2021 10:50:57'!
addTheReportOf: anAccount to: aTree

	| reportOfAnAccount |

	reportOfAnAccount := anAccount acceptVisitor: self.
	self addSpacesToTheAccountsOf: reportOfAnAccount.
	aTree addAll: reportOfAnAccount.
	! !

!MakerOfAPortfolioDetailedTreePrinter methodsFor: 'reports' stamp: 'MGD 12/6/2021 10:51:28'!
visitAPortfolio: aPortfolio
	
	| reportOfAPortfolio |
	
	reportOfAPortfolio := OrderedCollection new.
	
	reportOfAPortfolio add:  ('Balance = ', (aPortfolio balance) asString).
	^ reportOfAPortfolio.
	! !

!MakerOfAPortfolioDetailedTreePrinter methodsFor: 'reports' stamp: 'MGD 12/6/2021 10:51:23'!
visitAReceptiveAccount: aReceptiveAccount

	| aMakerOfASummary |
	
	aMakerOfASummary := MakerOfASummary new.
	
	^ aMakerOfASummary doOf: aReceptiveAccount.! !


!classDefinition: #MakerOfAPortfolioTreePrinter category: 'ServiciosFinancieros'!
MakerOfATreePrinter subclass: #MakerOfAPortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!MakerOfAPortfolioTreePrinter methodsFor: 'treesCreation' stamp: 'MGD 12/6/2021 10:14:56'!
doATreeOf: anAccount
	
	| aTree |
	
	aTree := OrderedCollection new.	
	
	aTree add: (anAccount name).
	self addTheTreeOfTheAccountsOf: anAccount to: aTree.
	
	^aTree! !


!classDefinition: #Transfer category: 'ServiciosFinancieros'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
