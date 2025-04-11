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
            --my-border-color: blue;
            font-size: 1.15rem;
          }
          aside {
            border: medium double var(--my-border-color);
            margin: 1em 1em 1.5em;
            /*padding: 0.25em 1em;*/
          }
          details {
            border-bottom: thin solid var(--my-border-color);
            padding: 0.25em 1em;
          }
          details:last-child {
            border-bottom: none;
          }
          summary {
            cursor: pointer;
            font-weight: bold;
            margin: 0.5em 0;
          }
          .front {
            margin-top: 2em;
            text-align: center;
          }
          li {
            font-size: 1.25rem;
            margin-bottom: 0.75rem;
          }
          aside li {
            font-size: 1.15rem;
          }
          ol ul {
            border: thin solid var(--my-border-color);
            margin: 0.5rem 1rem 1.5rem;
            padding: 0.75em 1.5em;
          }
          li li {
            font-size: 1.15rem;
            margin-bottom: 0;
          }
        ]]></style>
        <!--  Javascript  -->
      </head>
      <body>
        <h1>
          <xsl:apply-templates select="/TEI//titleStmt/title"/>
        </h1>
        <xsl:call-template name="show-teiHeader"/>
        <xsl:apply-templates select="TEI/text"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="@xml:id">
    <xsl:attribute name="id" select="data(.)"/>
  </xsl:template>
  
  <xsl:template match="div">
    <div>
      <xsl:apply-templates select="@* | node()"/>
    </div>
  </xsl:template>
  
  <xsl:template match="sourceDesc/bibl">
    <p>
      <xsl:apply-templates select="* except note"/>
    </p>
    <xsl:apply-templates select="note"/>
  </xsl:template>
  
  <xsl:template match="sourceDesc/bibl/*" priority="5">
    <xsl:if test="preceding-sibling::* and not(self::note)">
      <br />
    </xsl:if>
    <xsl:next-match/>
  </xsl:template>
  
  <xsl:template match="front">
    <div class="front">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="front/head[not(@type)]">
    <h2>
      <xsl:apply-templates/>
      <br />
      <small>
        <xsl:apply-templates select="following-sibling::head[@type eq 'sub']">
          <xsl:with-param name="show" select="true()"/>
        </xsl:apply-templates>
      </small>
    </h2>
  </xsl:template>
  
  <xsl:template match="front/head[@type eq 'sub']" priority="2">
    <xsl:param name="show" select="false()" as="xs:boolean"/>
    <xsl:if test="$show">
      <xsl:apply-templates/>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="listChange">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  
  <xsl:template match="change">
    <li>
      <strong>
        <xsl:value-of select="@when"/>
        <xsl:text>:</xsl:text>
      </strong>
      <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  
  <xsl:template match="body//head">
    <h3>
      <xsl:apply-templates select="@* | node()"/>
    </h3>
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
  
  <xsl:template match="ptr[@target]">
    <a href="{data(@target)}">
      <xsl:value-of select="data(@target)"/>
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
  
  <xsl:template name="show-teiHeader">
    <xsl:variable name="teiHeader" select="/TEI/teiHeader"/>
    <aside>
      <details open="open">
        <summary>Publication Statement</summary>
        <p>Generated on <xsl:value-of select="current-date()"/> from a 
          <a href="endings-principles-for-digital-longevity.xml">TEI encoding</a> of the Endings 
          Principles.
        </p>
        <xsl:apply-templates select="$teiHeader//publicationStmt"/>
      </details>
      <details open="open">
        <summary>Source Description</summary>
        <xsl:apply-templates select="$teiHeader//sourceDesc"/>
      </details>
      <details open="open">
        <summary>Revisions</summary>
        <xsl:apply-templates select="$teiHeader/revisionDesc"/>
      </details>
    </aside>
  </xsl:template>
  
 <!--
      FUNCTIONS
   -->
  
</xsl:stylesheet>