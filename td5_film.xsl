<?xml version='1.0'?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html><head><title>Visualisation</title></head>
            <body>
                <h2> Liste des 7 films de ma base </h2>
                <table border="2">
                    <tr>
                        <th>N°</th>
                        <th>Titre</th>
                        <th>Réalisateur</th>
                        <th>Pays</th>
                        <th>Genre</th>
                        <th>Durée</th>
                        <th>Affiche</th>
                        <th>(Critique)Ils ont aimé</th>
                    </tr>
                    <xsl:for-each select="FILMS/Film">
                        <xsl:sort select="Titre"/>
                        <tr>
                            <td><xsl:number value="position()"/></td>
                            <td><xsl:value-of select="Titre"/></td>
                            <td>
                                <!--<xsl:apply-templates select="Realisateur"/>-->
                                <!--<xsl:value-of select="count(Realisateur)"/>-->
                                <xsl:choose>
                                    <xsl:when test="count(Realisateur) > 2">
                                        Film collectif
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="Realisateur"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td><xsl:value-of select="Pays"/></td>
                            <td><xsl:value-of select="Genre"/></td>
                            <td><xsl:value-of select="Duree"/></td>
                            <td>
                                <img width="60">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="@Affiche"></xsl:value-of>
                                    </xsl:attribute>
                                </img>
                            </td>
                            <td>
                                <a href="critiques.html">Lire les critiques</a>
                                <xsl:if test="Critique[2]/Note > 0">
                                    <xsl:value-of select="Critique[2]/Media"/>
                                </xsl:if>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>