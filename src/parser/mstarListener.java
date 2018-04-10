// Generated from C:/Users/99486/Desktop/Compiler Projects/mstar/src/parser\mstar.g4 by ANTLR 4.7
package parser;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link mstarParser}.
 */
public interface mstarListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link mstarParser#compilationUnit}.
	 * @param ctx the parse tree
	 */
	void enterCompilationUnit(mstarParser.CompilationUnitContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#compilationUnit}.
	 * @param ctx the parse tree
	 */
	void exitCompilationUnit(mstarParser.CompilationUnitContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#globalDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterGlobalDeclaration(mstarParser.GlobalDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#globalDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitGlobalDeclaration(mstarParser.GlobalDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#globalVariableDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterGlobalVariableDeclaration(mstarParser.GlobalVariableDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#globalVariableDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitGlobalVariableDeclaration(mstarParser.GlobalVariableDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#functionDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDeclaration(mstarParser.FunctionDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#functionDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDeclaration(mstarParser.FunctionDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#classDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterClassDeclaration(mstarParser.ClassDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#classDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitClassDeclaration(mstarParser.ClassDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#classBody}.
	 * @param ctx the parse tree
	 */
	void enterClassBody(mstarParser.ClassBodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#classBody}.
	 * @param ctx the parse tree
	 */
	void exitClassBody(mstarParser.ClassBodyContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#classBodyDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterClassBodyDeclaration(mstarParser.ClassBodyDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#classBodyDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitClassBodyDeclaration(mstarParser.ClassBodyDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#constructorDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterConstructorDeclaration(mstarParser.ConstructorDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#constructorDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitConstructorDeclaration(mstarParser.ConstructorDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#methodDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterMethodDeclaration(mstarParser.MethodDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#methodDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitMethodDeclaration(mstarParser.MethodDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#fieldDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterFieldDeclaration(mstarParser.FieldDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#fieldDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitFieldDeclaration(mstarParser.FieldDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#type}.
	 * @param ctx the parse tree
	 */
	void enterType(mstarParser.TypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#type}.
	 * @param ctx the parse tree
	 */
	void exitType(mstarParser.TypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#primitiveType}.
	 * @param ctx the parse tree
	 */
	void enterPrimitiveType(mstarParser.PrimitiveTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#primitiveType}.
	 * @param ctx the parse tree
	 */
	void exitPrimitiveType(mstarParser.PrimitiveTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#classType}.
	 * @param ctx the parse tree
	 */
	void enterClassType(mstarParser.ClassTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#classType}.
	 * @param ctx the parse tree
	 */
	void exitClassType(mstarParser.ClassTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#atomType}.
	 * @param ctx the parse tree
	 */
	void enterAtomType(mstarParser.AtomTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#atomType}.
	 * @param ctx the parse tree
	 */
	void exitAtomType(mstarParser.AtomTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void enterParameterList(mstarParser.ParameterListContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void exitParameterList(mstarParser.ParameterListContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#parameter}.
	 * @param ctx the parse tree
	 */
	void enterParameter(mstarParser.ParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#parameter}.
	 * @param ctx the parse tree
	 */
	void exitParameter(mstarParser.ParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#functionBody}.
	 * @param ctx the parse tree
	 */
	void enterFunctionBody(mstarParser.FunctionBodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#functionBody}.
	 * @param ctx the parse tree
	 */
	void exitFunctionBody(mstarParser.FunctionBodyContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#statementList}.
	 * @param ctx the parse tree
	 */
	void enterStatementList(mstarParser.StatementListContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#statementList}.
	 * @param ctx the parse tree
	 */
	void exitStatementList(mstarParser.StatementListContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(mstarParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(mstarParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#forControl}.
	 * @param ctx the parse tree
	 */
	void enterForControl(mstarParser.ForControlContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#forControl}.
	 * @param ctx the parse tree
	 */
	void exitForControl(mstarParser.ForControlContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#forInit}.
	 * @param ctx the parse tree
	 */
	void enterForInit(mstarParser.ForInitContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#forInit}.
	 * @param ctx the parse tree
	 */
	void exitForInit(mstarParser.ForInitContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void enterExpressionList(mstarParser.ExpressionListContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void exitExpressionList(mstarParser.ExpressionListContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#localVariableDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterLocalVariableDeclaration(mstarParser.LocalVariableDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#localVariableDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitLocalVariableDeclaration(mstarParser.LocalVariableDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#variableDeclarators}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclarators(mstarParser.VariableDeclaratorsContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#variableDeclarators}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclarators(mstarParser.VariableDeclaratorsContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#variableDeclarator}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclarator(mstarParser.VariableDeclaratorContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#variableDeclarator}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclarator(mstarParser.VariableDeclaratorContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(mstarParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(mstarParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#primary}.
	 * @param ctx the parse tree
	 */
	void enterPrimary(mstarParser.PrimaryContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#primary}.
	 * @param ctx the parse tree
	 */
	void exitPrimary(mstarParser.PrimaryContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#literal}.
	 * @param ctx the parse tree
	 */
	void enterLiteral(mstarParser.LiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#literal}.
	 * @param ctx the parse tree
	 */
	void exitLiteral(mstarParser.LiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#creator}.
	 * @param ctx the parse tree
	 */
	void enterCreator(mstarParser.CreatorContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#creator}.
	 * @param ctx the parse tree
	 */
	void exitCreator(mstarParser.CreatorContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#functionCall}.
	 * @param ctx the parse tree
	 */
	void enterFunctionCall(mstarParser.FunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#functionCall}.
	 * @param ctx the parse tree
	 */
	void exitFunctionCall(mstarParser.FunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link mstarParser#argumentList}.
	 * @param ctx the parse tree
	 */
	void enterArgumentList(mstarParser.ArgumentListContext ctx);
	/**
	 * Exit a parse tree produced by {@link mstarParser#argumentList}.
	 * @param ctx the parse tree
	 */
	void exitArgumentList(mstarParser.ArgumentListContext ctx);
}