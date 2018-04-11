// Generated from C:/Users/99486/Desktop/Compiler Projects/mstar/src\Mstar.g4 by ANTLR 4.7
package parser;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MstarParser}.
 */
public interface MstarListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link MstarParser#compilationUnit}.
	 * @param ctx the parse tree
	 */
	void enterCompilationUnit(MstarParser.CompilationUnitContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#compilationUnit}.
	 * @param ctx the parse tree
	 */
	void exitCompilationUnit(MstarParser.CompilationUnitContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#globalDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterGlobalDeclaration(MstarParser.GlobalDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#globalDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitGlobalDeclaration(MstarParser.GlobalDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#globalVariableDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterGlobalVariableDeclaration(MstarParser.GlobalVariableDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#globalVariableDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitGlobalVariableDeclaration(MstarParser.GlobalVariableDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#functionDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDeclaration(MstarParser.FunctionDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#functionDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDeclaration(MstarParser.FunctionDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#classDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterClassDeclaration(MstarParser.ClassDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#classDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitClassDeclaration(MstarParser.ClassDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#classBody}.
	 * @param ctx the parse tree
	 */
	void enterClassBody(MstarParser.ClassBodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#classBody}.
	 * @param ctx the parse tree
	 */
	void exitClassBody(MstarParser.ClassBodyContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#classBodyDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterClassBodyDeclaration(MstarParser.ClassBodyDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#classBodyDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitClassBodyDeclaration(MstarParser.ClassBodyDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#constructorDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterConstructorDeclaration(MstarParser.ConstructorDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#constructorDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitConstructorDeclaration(MstarParser.ConstructorDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#methodDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterMethodDeclaration(MstarParser.MethodDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#methodDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitMethodDeclaration(MstarParser.MethodDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#fieldDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterFieldDeclaration(MstarParser.FieldDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#fieldDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitFieldDeclaration(MstarParser.FieldDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#type}.
	 * @param ctx the parse tree
	 */
	void enterType(MstarParser.TypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#type}.
	 * @param ctx the parse tree
	 */
	void exitType(MstarParser.TypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#primitiveType}.
	 * @param ctx the parse tree
	 */
	void enterPrimitiveType(MstarParser.PrimitiveTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#primitiveType}.
	 * @param ctx the parse tree
	 */
	void exitPrimitiveType(MstarParser.PrimitiveTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#classType}.
	 * @param ctx the parse tree
	 */
	void enterClassType(MstarParser.ClassTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#classType}.
	 * @param ctx the parse tree
	 */
	void exitClassType(MstarParser.ClassTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#atomType}.
	 * @param ctx the parse tree
	 */
	void enterAtomType(MstarParser.AtomTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#atomType}.
	 * @param ctx the parse tree
	 */
	void exitAtomType(MstarParser.AtomTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void enterParameterList(MstarParser.ParameterListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void exitParameterList(MstarParser.ParameterListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#parameter}.
	 * @param ctx the parse tree
	 */
	void enterParameter(MstarParser.ParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#parameter}.
	 * @param ctx the parse tree
	 */
	void exitParameter(MstarParser.ParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#functionBody}.
	 * @param ctx the parse tree
	 */
	void enterFunctionBody(MstarParser.FunctionBodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#functionBody}.
	 * @param ctx the parse tree
	 */
	void exitFunctionBody(MstarParser.FunctionBodyContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#statementList}.
	 * @param ctx the parse tree
	 */
	void enterStatementList(MstarParser.StatementListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#statementList}.
	 * @param ctx the parse tree
	 */
	void exitStatementList(MstarParser.StatementListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(MstarParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(MstarParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#forControl}.
	 * @param ctx the parse tree
	 */
	void enterForControl(MstarParser.ForControlContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#forControl}.
	 * @param ctx the parse tree
	 */
	void exitForControl(MstarParser.ForControlContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#forInit}.
	 * @param ctx the parse tree
	 */
	void enterForInit(MstarParser.ForInitContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#forInit}.
	 * @param ctx the parse tree
	 */
	void exitForInit(MstarParser.ForInitContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void enterExpressionList(MstarParser.ExpressionListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void exitExpressionList(MstarParser.ExpressionListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#localVariableDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterLocalVariableDeclaration(MstarParser.LocalVariableDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#localVariableDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitLocalVariableDeclaration(MstarParser.LocalVariableDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#variableDeclarators}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclarators(MstarParser.VariableDeclaratorsContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#variableDeclarators}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclarators(MstarParser.VariableDeclaratorsContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#variableDeclarator}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclarator(MstarParser.VariableDeclaratorContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#variableDeclarator}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclarator(MstarParser.VariableDeclaratorContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(MstarParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(MstarParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#primary}.
	 * @param ctx the parse tree
	 */
	void enterPrimary(MstarParser.PrimaryContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#primary}.
	 * @param ctx the parse tree
	 */
	void exitPrimary(MstarParser.PrimaryContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#literal}.
	 * @param ctx the parse tree
	 */
	void enterLiteral(MstarParser.LiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#literal}.
	 * @param ctx the parse tree
	 */
	void exitLiteral(MstarParser.LiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#creator}.
	 * @param ctx the parse tree
	 */
	void enterCreator(MstarParser.CreatorContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#creator}.
	 * @param ctx the parse tree
	 */
	void exitCreator(MstarParser.CreatorContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#functionCall}.
	 * @param ctx the parse tree
	 */
	void enterFunctionCall(MstarParser.FunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#functionCall}.
	 * @param ctx the parse tree
	 */
	void exitFunctionCall(MstarParser.FunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link MstarParser#argumentList}.
	 * @param ctx the parse tree
	 */
	void enterArgumentList(MstarParser.ArgumentListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MstarParser#argumentList}.
	 * @param ctx the parse tree
	 */
	void exitArgumentList(MstarParser.ArgumentListContext ctx);
}