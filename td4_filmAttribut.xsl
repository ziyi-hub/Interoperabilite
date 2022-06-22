<?xml version='1.0'?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html><head><title>Visualisation</title></head>
            <body>
                <h2> Liste des films de ma base </h2>
                <table border="2">
                    <tr>
                        <th>N°</th>
                        <th>Titre</th>
                        <th>Réalisateur</th>
                        <th>Pays</th>
                        <th>Genre</th>
                        <th>Durée</th>
                        <th>Affiche</th>
                    </tr>
                    <xsl:for-each select="FILMS/Film">
                        <tr>
                            <td><xsl:number value="position()"/></td>
                            <td><xsl:value-of select="Titre"/></td>
                            <td><xsl:value-of select="Realisateur"/></td>
                            <td><xsl:value-of select="Pays"/></td>
                            <td><xsl:value-of select="Genre"/></td>
                            <td><xsl:value-of select="Duree"/></td>
                            <td>
                                <img width="70">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="@Affiche"></xsl:value-of>
                                    </xsl:attribute>
                                </img>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>