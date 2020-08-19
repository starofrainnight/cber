
#include "CberBaseListener.h"
#include "CberLexer.h"
#include "CberParser.h"
#include <iostream>
#include <memory>
#include <stdio.h>
#include <string>

// using namespace antlr4;

int main(int argc, const char *argv[]) {
  auto inputStream = std::make_unique<antlr4::ANTLRInputStream>("hello world");
  auto lexer = std::make_unique<CberLexer>(inputStream.get());
  auto tokenStream = std::make_unique<antlr4::CommonTokenStream>(lexer.get());
  auto parser = std::make_unique<CberParser>(tokenStream.get());
  auto walker = std::make_unique<antlr4::tree::ParseTreeWalker>();
  auto listener = std::make_unique<CberBaseListener>();
  walker->walk(listener.get(), parser->r());
  std::cout << parser->getATN().toString() << std::endl;

  // JiaLexer lexer = new JiaLexer(inputStream);
  // CommonTokenStream tokenStream = new CommonTokenStream(lexer);

  // JiaParser parser = new JiaParser(tokenStream);
  // ParseTreeWalker walker = new ParseTreeWalker();
  // JiaListener jiaListener = new JiaListener();
  // walker.walk(jiaListener, parser.expres());
  // System.out.println(jiaListener.result());
  return 0;
}
