<xsl:stylesheet
        xmlns:nota="http://nota.org/schema/nota"
        xmlns:lebewesen="http://nota.org/schema/lebewesen"
        xmlns:kultur="http://nota.org/schema/kultur"
        xmlns:profession="http://nota.org/schema/profession"
        xmlns:talent="http://nota.org/schema/talent"
        xmlns:aktionen="http://nota.org/schema/kampf/aktionen"
        xmlns:fertigkeit="http://nota.org/schema/fertigkeit"
        xmlns:besonderheit="http://nota.org/schema/besonderheit"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://nota.org/schema/nota ..\..\nota\input\static\schema\nota.xsd
                http://nota.org/schema/lebewesen ..\..\nota\input\static\schema\lebewesen.xsd
                http://nota.org/schema/kampf/aktionen ..\..\nota\input\static\schema\kampf\aktionen.xsd
                http://nota.org/schema/kultur ..\..\nota\input\static\schema\kultur.xsd
                http://nota.org/schema/profession ..\..\nota\input\static\schema\profession.xsd
                http://nota.org/schema/talent ..\..\nota\input\static\schema\talent.xsd
                http://nota.org/schema/fertigkeit ..\..\nota\input\static\schema\fertigkeit.xsd 
                http://nota.org/schema/besonderheit ..\..\nota\input\static\schema\besonderheit.xsd"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="nota:Daten">
    <xsl:apply-templates select="aktionen:Aktionen"/>
  </xsl:template>

  <xsl:template match="aktionen:Aktionen">
    <Aktionen>
      <xsl:apply-templates select="aktionen:Aktion"/>
    </Aktionen>
  </xsl:template>
<!--Identity template, 
        provides default behavior that copies all content into the output -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()|text()"/>
        </xsl:copy>
    </xsl:template>

<xsl:template match="text()">
  <xsl:call-template name="replace-string">
    <xsl:with-param name="text" select="."/>
    <xsl:with-param name="replace" select="'$x'" />
    <xsl:with-param name="with" select="'&#x1f167;'"/>
  </xsl:call-template>
</xsl:template>


  <xsl:template match="aktionen:Aktion">
    <Aktion>
      <Original>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </Original>

      <xsl:choose>
        <xsl:when test="./aktionen:Mod/@ModifierType='Bonus'">
          <Bonus><xsl:apply-templates select="aktionen:Mod/*"/></Bonus>
        </xsl:when>
        <xsl:when test="./aktionen:Mod/@ModifierType='Malus'">
          <Malus><xsl:apply-templates select="aktionen:Mod/*"/></Malus>
        </xsl:when>
      </xsl:choose>


    </Aktion>
  </xsl:template>



  <!-- <xsl:template match="*">
    <Error>
      [FEHLER IM XSLT] <xsl:value-of select ="name(.)"/>
    </Error>
  </xsl:template> -->

  <xsl:template match="aktionen:ConcreteModValueType">
    <xsl:value-of select="@Value"/>
    <xsl:if test="@Type='Percent'">%</xsl:if>
  </xsl:template>

<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

<xsl:template name="replace-string">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="with"/>
    <xsl:choose>
      <xsl:when test="contains($text,$replace)">
        <xsl:value-of select="substring-before($text,$replace)"/>
        <xsl:value-of select="$with"/>
        <xsl:call-template name="replace-string">
          <xsl:with-param name="text"
select="substring-after($text,$replace)"/>
          <xsl:with-param name="replace" select="$replace"/>
          <xsl:with-param name="with" select="$with"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="aktionen:VariableModValueType">
    <!-- <xsl:value-of select="@Value"/> -->
      <xsl:choose>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='a'">&#x1f150;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='b'">&#x1f151;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='c'">&#x1f152;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='d'">&#x1f153;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='e'">&#x1f154;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='f'">&#x1f155;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='g'">&#x1f156;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='h'">&#x1f157;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='i'">&#x1f158;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='j'">&#x1f159;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='k'">&#x1f15a;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='l'">&#x1f15b;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='m'">&#x1f15c;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='n'">&#x1f15d;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='o'">&#x1f15e;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='p'">&#x1f15f;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='q'">&#x1f160;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='r'">&#x1f161;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='s'">&#x1f162;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='t'">&#x1f163;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='u'">&#x1f164;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='v'">&#x1f165;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='w'">&#x1f166;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='x'">&#x1f167;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='y'">&#x1f168;</xsl:when>
        <xsl:when test="translate(@Value, $uppercase, $lowercase)='z'">&#x1f169;</xsl:when>
      </xsl:choose>
  </xsl:template>

  <xsl:template match="aktionen:AddModValueType">
    <xsl:apply-templates select="./*[1]"/><xsl:for-each select="./*[position()>1]"> + <xsl:apply-templates select="."/></xsl:for-each>
  </xsl:template>

  <xsl:template match="aktionen:SubstractModValueType">
    <xsl:apply-templates select="./*[1]"/><xsl:for-each select="./*[position()>1]"> - <xsl:apply-templates select="."/></xsl:for-each>
  </xsl:template>

  <xsl:template match="aktionen:MultiplyModValueType">
    <xsl:apply-templates select="./*[1]"/><xsl:for-each select="./*[position()>1]"> &#8226; <xsl:apply-templates select="."/></xsl:for-each>
  </xsl:template>

  <!-- <xsl:template match="*">
    [[FEHLER IM XSLT]] (<xsl:value-of select="local-name()"/>)
  </xsl:template> -->


</xsl:stylesheet>