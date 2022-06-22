<?xml version='1.0'?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
    <xsl:output method="xml" indent="yes"/>
        <xsl:template match="/">
            <BASE>
                <FILMS>
                    <xsl:apply-templates mode="Film"/>
                </FILMS>
                <REALISATEURS>
                    <xsl:apply-templates mode="Realisateur"/>
                </REALISATEURS>
                <ACTEURS>
                    <xsl:apply-templates mode="Acteur"/>
                </ACTEURS>
            </BASE>
        </xsl:template>

    <xsl:template match="FILMS/Film" mode="Film">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="REALISATEURREF">
                <xsl:apply-templates select="Realisateur"/>
            </xsl:attribute>
            <xsl:if test="Acteurs">
                <xsl:attribute name="ACTEURREF">
                    <xsl:apply-templates select="Acteurs/Acteur"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="*[not(self::Realisateur or self::Acteurs)]"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Acteurs/Acteur" >
        <xsl:choose>
            <xsl:when test="position() != last()">
                <xsl:value-of select="@*"/>
                <xsl:text> </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="@*"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Realisateur" >
        <xsl:choose>
            <xsl:when test="position() != last()">
                <xsl:value-of select="@*"/>
                <xsl:text> </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="@*"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="FILMS/Film" mode="Realisateur">
        <xsl:copy-of select="Realisateur[not(@ID = ../preceding-sibling::*/Realisateur/@ID)]"/>
    </xsl:template>

    <xsl:template match="FILMS/Film" mode="Acteur">
            <xsl:copy-of select="Acteurs/Acteur"/>
    </xsl:template>


    <xsl:template name="formatdate">
        <xsl:param name="DateTimeStr" />

        <xsl:variable name="datestr">
            <xsl:value-of select="substring-before($DateTimeStr,'T')" />
        </xsl:variable>

        <xsl:variable name="mm">
            <xsl:value-of select="substring($datestr,6,2)" />
        </xsl:variable>

        <xsl:variable name="dd">
            <xsl:value-of select="substring($datestr,9,2)" />
        </xsl:variable>

        <xsl:variable name="yyyy">
            <xsl:value-of select="substring($datestr,1,4)" />
        </xsl:variable>

        <xsl:value-of select="concat($mm,'/', $dd, '/', $yyyy)" />
    </xsl:template>

</xsl:stylesheet>