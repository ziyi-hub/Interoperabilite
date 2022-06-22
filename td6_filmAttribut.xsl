<?xml version='1.0'?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:key name="Acteur" match="BASE/ACTEURS/Acteur" use="@ID"/>
    <xsl:key name="Realisateur" match="BASE/REALISATEURS/Realisateur" use="@ID"/>
    <xsl:template match="/">
        <html><head><title>Visualisation</title></head>
            <body>
                <h2> Liste des count des films de ma base </h2>
                <table border="2">
                    <tr>
                        <th>N°</th>
                        <th>Titre</th>
                        <th>Réalisateur</th>
                        <th>Pays</th>
                        <th>Genre</th>
                        <th>Durée</th>
                        <th>Affiche</th>
                        <th>Ils ont aimé</th>
                        <th>Acteur</th>
                    </tr>
                    <xsl:apply-templates select="BASE/FILMS"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Film">
    <tr>
        <td><xsl:number value="position()"/></td>
        <td><xsl:value-of select="Titre"/></td>
        <td>
            <xsl:variable name="refReal" select="@REALISATEURREF"/>
            <xsl:choose>
                <xsl:when test="count(../../REALISATEURS/Realisateur[contains($refReal, @ID)]) > 2">
                    Film collectif
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="../../REALISATEURS/Realisateur[contains($refReal, @ID)]"/>
                </xsl:otherwise>
            </xsl:choose>
        </td>
        <td><xsl:value-of select="Pays"/></td>
        <td><xsl:value-of select="Genre"/></td>
        <td><xsl:value-of select="Duree"/></td>
        <td>
            <img width="60">
                <xsl:attribute name="src">
                    <xsl:value-of select="@Affiche"/>
                </xsl:attribute>
            </img>
        </td>
        <td>
            <xsl:if test="Critique[2]/Note">
                <xsl:value-of select="Critique[2]/Media"/>
            </xsl:if>
        </td>
        <td>
            <!--<xsl:value-of select="@ACTEURREF"/>-->
            <!--<xsl:copy-of select="key('Acteur', 'a01')"/>-->
            <xsl:variable name="refActeur" select="@ACTEURREF"/>
            <xsl:apply-templates select="../../ACTEURS/Acteur[contains($refActeur, @ID)]"/>
        </td>
    </tr>
    </xsl:template>


</xsl:stylesheet>