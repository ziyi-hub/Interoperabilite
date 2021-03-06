<?xml version='1.0' encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="*">
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="@*">
        Attribut : <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="text()">
        Feuille : <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>
