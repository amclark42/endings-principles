<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://www.w3.org/1999/xhtml"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="#all"
  version="3.0">
  
<!--
    ...
    
    Ash Clark
    2025
  -->
  
  <xsl:output encoding="UTF-8" indent="yes" method="xhtml" omit-xml-declaration="no"/>
  
 <!--
      PARAMETERS
   -->
  
 <!--
      GLOBAL VARIABLES
   -->
  
  <xsl:variable name="categories" select="//classDecl//category[@xml:id]"/>
  
  
 <!--
      FALLBACK TEMPLATES
   -->
  
  <xsl:template match="*" mode="#all">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="text()" mode="#all">
    <xsl:copy/>
  </xsl:template>
  
  <xsl:template match="@* | comment() | processing-instruction()" mode="#all"/>
  
  
 <!--
      TEMPLATES, #default mode
   -->
  
  <xsl:template match="/">
    <xsl:text>&#x0A;</xsl:text>
    <html lang="en">
      <head>
        <title>
          <xsl:value-of select="//titleStmt/title/normalize-space(.)"/>
        </title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!--  CSS  -->
        <style><![CDATA[
          body {
            font-size: 1.15rem;
          }
          li {
            font-size: 1.25rem;
            margin-bottom: 0.75rem;
          }
          ol ul {
            margin-top: 0.5rem;
          }
          li li {
            font-size: 1.15rem;
            margin-bottom: 0;
          }
        ]]></style>
        <!--  Javascript  -->
      </head>
      <body>
        <xsl:apply-templates select="TEI/text"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="@xml:id">
    <xsl:attribute name="id" select="data(.)"/>
  </xsl:template>
  
  <xsl:template match="text">
    <xsl:apply-templates select="body"/>
  </xsl:template>
  
  <xsl:template match="div">
    <div>
      <xsl:apply-templates select="@* | node()"/>
    </div>
  </xsl:template>
  
  <xsl:template match="body//head">
    <h2>
      <xsl:apply-templates select="@* | node()"/>
    </h2>
  </xsl:template>
  
  <xsl:template match="p">
    <p>
      <xsl:apply-templates select="@* | node()"/>
    </p>
  </xsl:template>
  
  <xsl:template match="ref[@target]">
    <a href="{data(@target)}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>
  
  <xsl:template match="list">
    <ol>
      <xsl:apply-templates select="@* | node()"/>
    </ol>
  </xsl:template>
  
  <xsl:template match="list/item">
    <li>
      <xsl:apply-templates select="@* except @ana | node()"/>
      <xsl:apply-templates select="@ana"/>
    </li>
  </xsl:template>
  
  <xsl:template match="list/item/@ana">
    <xsl:variable name="aboutThisItem" as="node()*">
      <xsl:variable name="catRefs" 
        select="tokenize(normalize-space(.), '\s+') ! substring-after(., '#')"/>
      <xsl:sequence select="$categories[@xml:id = $catRefs]"/>
    </xsl:variable>
    <xsl:if test="exists($aboutThisItem)">
      <ul>
        <xsl:for-each select="$aboutThisItem">
          <li>
            <strong>
              <xsl:value-of select="@n"/>
              <xsl:text>:</xsl:text>
            </strong>
            <xsl:text> </xsl:text>
            <xsl:value-of select="normalize-space(.)"/>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>
  </xsl:template>
  
  
 <!--
      NAMED TEMPLATES
   -->
  
 <!--
      FUNCTIONS
   -->
  
</xsl:stylesheet>