<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Thu Mar 23 18:59:36 CET 2017 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<body>
				<h3 style="text-decoration: underline;" >Calendrier</h3>
				<table  border="3" width="100%" align="center">
					<tr>
						<th>Titre</th>
						<th>Date</th>
						<th>Summary</th>
						<th>URL</th>
						<th>Description</th>
					</tr>
					<xsl:for-each select="//event">
					<xsl:sort select="./title"/>
						<xsl:apply-templates select="current()"/>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="event">
		<tr>
			<td>
				<xsl:value-of select="./title"/>
			</td>
			<td>
				<xsl:value-of select="concat('le ', substring(./dtstart, 7, 2), '-', substring(./dtstart, 5, 2), '-', substring(./dtstart, 1, 4),                         ' de ', substring(./dtstart, 10, 2), 'h', substring(./dtstart, 12, 2),                         ' a ', substring(./dtend, 10, 2), 'h', substring(./dtend, 12, 2))"/>
			</td>
			<td>
				<xsl:value-of select="./summary"/>
			</td>
			<td>
				<xsl:value-of select="./url"/>
			</td>
			<td>
				<xsl:value-of select="./description"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
