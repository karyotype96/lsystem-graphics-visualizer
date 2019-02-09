public class LSystem {
  private ArrayList variables;
  private ArrayList ruleset;
  private String axiom;
  private String current_string;
  
  private int read_index;
  
  LSystem(){
    variables = new ArrayList();
    ruleset = new ArrayList();
    axiom = "";
    current_string = axiom;
    read_index = 0;
  }
  
  void addRule(char item, String next){
    variables.add(item);
    ruleset.add(next);
  }
  
  void setAxiom(String a){
    axiom = a;
  }
  
  void iterate(){
    String new_string_buffer = "";
    int n;
    for (char current_char: current_string.toCharArray()){
      n = variables.indexOf(current_char);
      if (n != -1){
        new_string_buffer += ruleset.get(n);
      } else {
        new_string_buffer += current_char;
      }
    }
    current_string = new_string_buffer;
  }
  
  void init_system(){
    current_string = axiom;
    read_index = 0;
  }
  
  void start_read(){
    read_index = 0;
  }
  
  boolean has_next(){
    return (read_index < current_string.length());
  }
  
  char get_next(){
    char c = 0;
    if (this.has_next()){
      c = current_string.toCharArray()[read_index];
      read_index++;
    }
    return c;
  }
}
