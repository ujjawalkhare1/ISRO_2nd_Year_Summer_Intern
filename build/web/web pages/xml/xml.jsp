<%@page import="java.io.*"%>
<%@page import="org.w3c.dom.*"%>
<%@page import="javax.xml.parsers.*"%>
<%@page import="javax.xml.transform.*"%>
<%@page import="javax.xml.transform.dom.*"%>
<%@page import="javax.xml.transform.stream.*"%>                                       
<%

try{
    String str="new";
    DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
    Document doc = docBuilder.newDocument();
    // questionset elements
    Element rootElement = doc.createElement("questionset");
    doc.appendChild(rootElement);
    // question elements
    Element question = doc.createElement("question");
    rootElement.appendChild(question);
    // set attribute to question element
    Attr attr = doc.createAttribute("category");
    attr.setValue("graph");
    question.setAttributeNode(attr);
    // write the content into xml file        

    TransformerFactory factory = TransformerFactory.newInstance();
    Transformer transformer = factory.newTransformer();

    transformer.setOutputProperty(OutputKeys.INDENT, "yes");

    StringWriter sw = new StringWriter();
    StreamResult result = new StreamResult(sw);
    DOMSource source = new DOMSource(doc);
    transformer.transform(source, result);
    String xmlString = sw.toString();

    File file=new File("D:/"+str+".xml");
    BufferedWriter bw = new BufferedWriter(new FileWriter(file));
    bw.write(xmlString);
    bw.flush();
    bw.close();
}
catch(Exception e)
{
System.out.println(e);
}   

%>
