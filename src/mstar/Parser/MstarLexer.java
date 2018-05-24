// Generated from C:/Users/99486/Desktop/Compiler Projects/mstar/src/mstar\Mstar.g4 by ANTLR 4.7
package mstar.Parser;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MstarLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.7", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, T__19=20, T__20=21, T__21=22, T__22=23, T__23=24, 
		T__24=25, T__25=26, T__26=27, T__27=28, T__28=29, T__29=30, T__30=31, 
		T__31=32, T__32=33, T__33=34, BOOL_LITERAL=35, NULL_LITERAL=36, STRING=37, 
		INT=38, BOOL=39, VOID=40, CLASS=41, IF=42, WHILE=43, FOR=44, BREAK=45, 
		CONTINUE=46, RETURN=47, THIS=48, NEW=49, ELSE=50, INT_LITERAL=51, STRING_LITERAL=52, 
		IDENTIFIER=53, LINE_COMMENT=54, BLOCK_COMMENT=55, WS=56;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] ruleNames = {
		"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
		"T__9", "T__10", "T__11", "T__12", "T__13", "T__14", "T__15", "T__16", 
		"T__17", "T__18", "T__19", "T__20", "T__21", "T__22", "T__23", "T__24", 
		"T__25", "T__26", "T__27", "T__28", "T__29", "T__30", "T__31", "T__32", 
		"T__33", "BOOL_LITERAL", "NULL_LITERAL", "STRING", "INT", "BOOL", "VOID", 
		"CLASS", "IF", "WHILE", "FOR", "BREAK", "CONTINUE", "RETURN", "THIS", 
		"NEW", "ELSE", "INT_LITERAL", "STRING_LITERAL", "IDENTIFIER", "LINE_COMMENT", 
		"BLOCK_COMMENT", "WS"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "';'", "'('", "')'", "'{'", "'}'", "'['", "']'", "','", "'='", "'.'", 
		"'++'", "'--'", "'+'", "'-'", "'~'", "'!'", "'*'", "'/'", "'%'", "'<<'", 
		"'>>'", "'<='", "'>='", "'<'", "'>'", "'=='", "'!='", "'&'", "'^'", "'|'", 
		"'&&'", "'||'", "'?'", "':'", null, "'null'", "'string'", "'int'", "'bool'", 
		"'void'", "'class'", "'if'", "'while'", "'for'", "'break'", "'continue'", 
		"'return'", "'this'", "'new'", "'else'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, "BOOL_LITERAL", 
		"NULL_LITERAL", "STRING", "INT", "BOOL", "VOID", "CLASS", "IF", "WHILE", 
		"FOR", "BREAK", "CONTINUE", "RETURN", "THIS", "NEW", "ELSE", "INT_LITERAL", 
		"STRING_LITERAL", "IDENTIFIER", "LINE_COMMENT", "BLOCK_COMMENT", "WS"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public MstarLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "Mstar.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2:\u0158\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64\t"+
		"\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\3\2\3\2\3\3\3\3\3\4\3\4"+
		"\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n\3\13\3\13\3\f\3\f\3\f"+
		"\3\r\3\r\3\r\3\16\3\16\3\17\3\17\3\20\3\20\3\21\3\21\3\22\3\22\3\23\3"+
		"\23\3\24\3\24\3\25\3\25\3\25\3\26\3\26\3\26\3\27\3\27\3\27\3\30\3\30\3"+
		"\30\3\31\3\31\3\32\3\32\3\33\3\33\3\33\3\34\3\34\3\34\3\35\3\35\3\36\3"+
		"\36\3\37\3\37\3 \3 \3 \3!\3!\3!\3\"\3\"\3#\3#\3$\3$\3$\3$\3$\3$\3$\3$"+
		"\3$\5$\u00cb\n$\3%\3%\3%\3%\3%\3&\3&\3&\3&\3&\3&\3&\3\'\3\'\3\'\3\'\3"+
		"(\3(\3(\3(\3(\3)\3)\3)\3)\3)\3*\3*\3*\3*\3*\3*\3+\3+\3+\3,\3,\3,\3,\3"+
		",\3,\3-\3-\3-\3-\3.\3.\3.\3.\3.\3.\3/\3/\3/\3/\3/\3/\3/\3/\3/\3\60\3\60"+
		"\3\60\3\60\3\60\3\60\3\60\3\61\3\61\3\61\3\61\3\61\3\62\3\62\3\62\3\62"+
		"\3\63\3\63\3\63\3\63\3\63\3\64\3\64\7\64\u0120\n\64\f\64\16\64\u0123\13"+
		"\64\3\65\3\65\3\65\3\65\3\65\3\65\7\65\u012b\n\65\f\65\16\65\u012e\13"+
		"\65\3\65\3\65\3\66\3\66\7\66\u0134\n\66\f\66\16\66\u0137\13\66\3\67\3"+
		"\67\3\67\3\67\7\67\u013d\n\67\f\67\16\67\u0140\13\67\3\67\3\67\38\38\3"+
		"8\38\78\u0148\n8\f8\168\u014b\138\38\38\38\38\38\39\69\u0153\n9\r9\16"+
		"9\u0154\39\39\4\u012c\u0149\2:\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13"+
		"\25\f\27\r\31\16\33\17\35\20\37\21!\22#\23%\24\'\25)\26+\27-\30/\31\61"+
		"\32\63\33\65\34\67\359\36;\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.[/]\60_\61"+
		"a\62c\63e\64g\65i\66k\67m8o9q:\3\2\7\3\2\62;\4\2C\\c|\6\2\62;C\\aac|\3"+
		"\2\f\f\5\2\13\f\17\17\"\"\2\u0160\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2"+
		"\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3"+
		"\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2"+
		"\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2"+
		"\2\2+\3\2\2\2\2-\3\2\2\2\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3\2"+
		"\2\2\2\67\3\2\2\2\29\3\2\2\2\2;\3\2\2\2\2=\3\2\2\2\2?\3\2\2\2\2A\3\2\2"+
		"\2\2C\3\2\2\2\2E\3\2\2\2\2G\3\2\2\2\2I\3\2\2\2\2K\3\2\2\2\2M\3\2\2\2\2"+
		"O\3\2\2\2\2Q\3\2\2\2\2S\3\2\2\2\2U\3\2\2\2\2W\3\2\2\2\2Y\3\2\2\2\2[\3"+
		"\2\2\2\2]\3\2\2\2\2_\3\2\2\2\2a\3\2\2\2\2c\3\2\2\2\2e\3\2\2\2\2g\3\2\2"+
		"\2\2i\3\2\2\2\2k\3\2\2\2\2m\3\2\2\2\2o\3\2\2\2\2q\3\2\2\2\3s\3\2\2\2\5"+
		"u\3\2\2\2\7w\3\2\2\2\ty\3\2\2\2\13{\3\2\2\2\r}\3\2\2\2\17\177\3\2\2\2"+
		"\21\u0081\3\2\2\2\23\u0083\3\2\2\2\25\u0085\3\2\2\2\27\u0087\3\2\2\2\31"+
		"\u008a\3\2\2\2\33\u008d\3\2\2\2\35\u008f\3\2\2\2\37\u0091\3\2\2\2!\u0093"+
		"\3\2\2\2#\u0095\3\2\2\2%\u0097\3\2\2\2\'\u0099\3\2\2\2)\u009b\3\2\2\2"+
		"+\u009e\3\2\2\2-\u00a1\3\2\2\2/\u00a4\3\2\2\2\61\u00a7\3\2\2\2\63\u00a9"+
		"\3\2\2\2\65\u00ab\3\2\2\2\67\u00ae\3\2\2\29\u00b1\3\2\2\2;\u00b3\3\2\2"+
		"\2=\u00b5\3\2\2\2?\u00b7\3\2\2\2A\u00ba\3\2\2\2C\u00bd\3\2\2\2E\u00bf"+
		"\3\2\2\2G\u00ca\3\2\2\2I\u00cc\3\2\2\2K\u00d1\3\2\2\2M\u00d8\3\2\2\2O"+
		"\u00dc\3\2\2\2Q\u00e1\3\2\2\2S\u00e6\3\2\2\2U\u00ec\3\2\2\2W\u00ef\3\2"+
		"\2\2Y\u00f5\3\2\2\2[\u00f9\3\2\2\2]\u00ff\3\2\2\2_\u0108\3\2\2\2a\u010f"+
		"\3\2\2\2c\u0114\3\2\2\2e\u0118\3\2\2\2g\u011d\3\2\2\2i\u0124\3\2\2\2k"+
		"\u0131\3\2\2\2m\u0138\3\2\2\2o\u0143\3\2\2\2q\u0152\3\2\2\2st\7=\2\2t"+
		"\4\3\2\2\2uv\7*\2\2v\6\3\2\2\2wx\7+\2\2x\b\3\2\2\2yz\7}\2\2z\n\3\2\2\2"+
		"{|\7\177\2\2|\f\3\2\2\2}~\7]\2\2~\16\3\2\2\2\177\u0080\7_\2\2\u0080\20"+
		"\3\2\2\2\u0081\u0082\7.\2\2\u0082\22\3\2\2\2\u0083\u0084\7?\2\2\u0084"+
		"\24\3\2\2\2\u0085\u0086\7\60\2\2\u0086\26\3\2\2\2\u0087\u0088\7-\2\2\u0088"+
		"\u0089\7-\2\2\u0089\30\3\2\2\2\u008a\u008b\7/\2\2\u008b\u008c\7/\2\2\u008c"+
		"\32\3\2\2\2\u008d\u008e\7-\2\2\u008e\34\3\2\2\2\u008f\u0090\7/\2\2\u0090"+
		"\36\3\2\2\2\u0091\u0092\7\u0080\2\2\u0092 \3\2\2\2\u0093\u0094\7#\2\2"+
		"\u0094\"\3\2\2\2\u0095\u0096\7,\2\2\u0096$\3\2\2\2\u0097\u0098\7\61\2"+
		"\2\u0098&\3\2\2\2\u0099\u009a\7\'\2\2\u009a(\3\2\2\2\u009b\u009c\7>\2"+
		"\2\u009c\u009d\7>\2\2\u009d*\3\2\2\2\u009e\u009f\7@\2\2\u009f\u00a0\7"+
		"@\2\2\u00a0,\3\2\2\2\u00a1\u00a2\7>\2\2\u00a2\u00a3\7?\2\2\u00a3.\3\2"+
		"\2\2\u00a4\u00a5\7@\2\2\u00a5\u00a6\7?\2\2\u00a6\60\3\2\2\2\u00a7\u00a8"+
		"\7>\2\2\u00a8\62\3\2\2\2\u00a9\u00aa\7@\2\2\u00aa\64\3\2\2\2\u00ab\u00ac"+
		"\7?\2\2\u00ac\u00ad\7?\2\2\u00ad\66\3\2\2\2\u00ae\u00af\7#\2\2\u00af\u00b0"+
		"\7?\2\2\u00b08\3\2\2\2\u00b1\u00b2\7(\2\2\u00b2:\3\2\2\2\u00b3\u00b4\7"+
		"`\2\2\u00b4<\3\2\2\2\u00b5\u00b6\7~\2\2\u00b6>\3\2\2\2\u00b7\u00b8\7("+
		"\2\2\u00b8\u00b9\7(\2\2\u00b9@\3\2\2\2\u00ba\u00bb\7~\2\2\u00bb\u00bc"+
		"\7~\2\2\u00bcB\3\2\2\2\u00bd\u00be\7A\2\2\u00beD\3\2\2\2\u00bf\u00c0\7"+
		"<\2\2\u00c0F\3\2\2\2\u00c1\u00c2\7v\2\2\u00c2\u00c3\7t\2\2\u00c3\u00c4"+
		"\7w\2\2\u00c4\u00cb\7g\2\2\u00c5\u00c6\7h\2\2\u00c6\u00c7\7c\2\2\u00c7"+
		"\u00c8\7n\2\2\u00c8\u00c9\7u\2\2\u00c9\u00cb\7g\2\2\u00ca\u00c1\3\2\2"+
		"\2\u00ca\u00c5\3\2\2\2\u00cbH\3\2\2\2\u00cc\u00cd\7p\2\2\u00cd\u00ce\7"+
		"w\2\2\u00ce\u00cf\7n\2\2\u00cf\u00d0\7n\2\2\u00d0J\3\2\2\2\u00d1\u00d2"+
		"\7u\2\2\u00d2\u00d3\7v\2\2\u00d3\u00d4\7t\2\2\u00d4\u00d5\7k\2\2\u00d5"+
		"\u00d6\7p\2\2\u00d6\u00d7\7i\2\2\u00d7L\3\2\2\2\u00d8\u00d9\7k\2\2\u00d9"+
		"\u00da\7p\2\2\u00da\u00db\7v\2\2\u00dbN\3\2\2\2\u00dc\u00dd\7d\2\2\u00dd"+
		"\u00de\7q\2\2\u00de\u00df\7q\2\2\u00df\u00e0\7n\2\2\u00e0P\3\2\2\2\u00e1"+
		"\u00e2\7x\2\2\u00e2\u00e3\7q\2\2\u00e3\u00e4\7k\2\2\u00e4\u00e5\7f\2\2"+
		"\u00e5R\3\2\2\2\u00e6\u00e7\7e\2\2\u00e7\u00e8\7n\2\2\u00e8\u00e9\7c\2"+
		"\2\u00e9\u00ea\7u\2\2\u00ea\u00eb\7u\2\2\u00ebT\3\2\2\2\u00ec\u00ed\7"+
		"k\2\2\u00ed\u00ee\7h\2\2\u00eeV\3\2\2\2\u00ef\u00f0\7y\2\2\u00f0\u00f1"+
		"\7j\2\2\u00f1\u00f2\7k\2\2\u00f2\u00f3\7n\2\2\u00f3\u00f4\7g\2\2\u00f4"+
		"X\3\2\2\2\u00f5\u00f6\7h\2\2\u00f6\u00f7\7q\2\2\u00f7\u00f8\7t\2\2\u00f8"+
		"Z\3\2\2\2\u00f9\u00fa\7d\2\2\u00fa\u00fb\7t\2\2\u00fb\u00fc\7g\2\2\u00fc"+
		"\u00fd\7c\2\2\u00fd\u00fe\7m\2\2\u00fe\\\3\2\2\2\u00ff\u0100\7e\2\2\u0100"+
		"\u0101\7q\2\2\u0101\u0102\7p\2\2\u0102\u0103\7v\2\2\u0103\u0104\7k\2\2"+
		"\u0104\u0105\7p\2\2\u0105\u0106\7w\2\2\u0106\u0107\7g\2\2\u0107^\3\2\2"+
		"\2\u0108\u0109\7t\2\2\u0109\u010a\7g\2\2\u010a\u010b\7v\2\2\u010b\u010c"+
		"\7w\2\2\u010c\u010d\7t\2\2\u010d\u010e\7p\2\2\u010e`\3\2\2\2\u010f\u0110"+
		"\7v\2\2\u0110\u0111\7j\2\2\u0111\u0112\7k\2\2\u0112\u0113\7u\2\2\u0113"+
		"b\3\2\2\2\u0114\u0115\7p\2\2\u0115\u0116\7g\2\2\u0116\u0117\7y\2\2\u0117"+
		"d\3\2\2\2\u0118\u0119\7g\2\2\u0119\u011a\7n\2\2\u011a\u011b\7u\2\2\u011b"+
		"\u011c\7g\2\2\u011cf\3\2\2\2\u011d\u0121\t\2\2\2\u011e\u0120\t\2\2\2\u011f"+
		"\u011e\3\2\2\2\u0120\u0123\3\2\2\2\u0121\u011f\3\2\2\2\u0121\u0122\3\2"+
		"\2\2\u0122h\3\2\2\2\u0123\u0121\3\2\2\2\u0124\u012c\7$\2\2\u0125\u0126"+
		"\7^\2\2\u0126\u012b\7$\2\2\u0127\u0128\7^\2\2\u0128\u012b\7^\2\2\u0129"+
		"\u012b\13\2\2\2\u012a\u0125\3\2\2\2\u012a\u0127\3\2\2\2\u012a\u0129\3"+
		"\2\2\2\u012b\u012e\3\2\2\2\u012c\u012d\3\2\2\2\u012c\u012a\3\2\2\2\u012d"+
		"\u012f\3\2\2\2\u012e\u012c\3\2\2\2\u012f\u0130\7$\2\2\u0130j\3\2\2\2\u0131"+
		"\u0135\t\3\2\2\u0132\u0134\t\4\2\2\u0133\u0132\3\2\2\2\u0134\u0137\3\2"+
		"\2\2\u0135\u0133\3\2\2\2\u0135\u0136\3\2\2\2\u0136l\3\2\2\2\u0137\u0135"+
		"\3\2\2\2\u0138\u0139\7\61\2\2\u0139\u013a\7\61\2\2\u013a\u013e\3\2\2\2"+
		"\u013b\u013d\n\5\2\2\u013c\u013b\3\2\2\2\u013d\u0140\3\2\2\2\u013e\u013c"+
		"\3\2\2\2\u013e\u013f\3\2\2\2\u013f\u0141\3\2\2\2\u0140\u013e\3\2\2\2\u0141"+
		"\u0142\b\67\2\2\u0142n\3\2\2\2\u0143\u0144\7\61\2\2\u0144\u0145\7,\2\2"+
		"\u0145\u0149\3\2\2\2\u0146\u0148\13\2\2\2\u0147\u0146\3\2\2\2\u0148\u014b"+
		"\3\2\2\2\u0149\u014a\3\2\2\2\u0149\u0147\3\2\2\2\u014a\u014c\3\2\2\2\u014b"+
		"\u0149\3\2\2\2\u014c\u014d\7,\2\2\u014d\u014e\7\61\2\2\u014e\u014f\3\2"+
		"\2\2\u014f\u0150\b8\2\2\u0150p\3\2\2\2\u0151\u0153\t\6\2\2\u0152\u0151"+
		"\3\2\2\2\u0153\u0154\3\2\2\2\u0154\u0152\3\2\2\2\u0154\u0155\3\2\2\2\u0155"+
		"\u0156\3\2\2\2\u0156\u0157\b9\2\2\u0157r\3\2\2\2\13\2\u00ca\u0121\u012a"+
		"\u012c\u0135\u013e\u0149\u0154\3\2\3\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}