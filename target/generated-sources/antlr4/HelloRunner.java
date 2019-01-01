

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
public class HelloRunner 
{
	public static void main( String[] args) throws Exception 
	{
		ANTLRInputStream input = new ANTLRInputStream( System.in);

		MATLABLexer lexer =new MATLABLexer(input);

		CommonTokenStream tokens = new CommonTokenStream(lexer);

		MATLABParser parser = new MATLABParser(tokens);
		ParseTree tree = parser.classDecl(); // begin parsing at rule 'r'
		System.out.println(tree.toStringTree(parser)); // print LISP-style tree
		
	}
}
