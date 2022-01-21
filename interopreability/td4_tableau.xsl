<?xml version='1.0'?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html><head><title>Visualisation</title></head>
            <body>
                <h2> Liste des films de ma base </h2>
                <table border="2" bgcolor="yellow">
                    <tr>
                        <th>Titre</th>
                        <th>Réalisateur</th>
                        <th>Pays</th>
                        <th>Genre</th>
                        <th>Durée</th>
                    </tr>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="FILMS/Film">
        <tr>
            <td><xsl:value-of select="Titre"/></td>
            <td><xsl:value-of select="Realisateur"/></td>
            <td><xsl:value-of select="Pays"/></td>
            <td><xsl:value-of select="Genre"/></td>
            <td><xsl:value-of select="Duree"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>