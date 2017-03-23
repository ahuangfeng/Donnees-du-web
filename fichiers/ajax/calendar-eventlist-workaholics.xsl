<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<ul>
			<xsl:apply-templates select="//event[title='Workaholics']"/>
		</ul>
	</xsl:template>
	<xsl:template match="event">
		<li>
			<b>Titre : </b><xsl:value-of select="./title"/>
		</li>
		<li>
			<b>Date : </b><xsl:value-of select="concat('le ', substring(./dtstart, 7, 2), '-', substring(./dtstart, 5, 2), '-', substring(./dtstart, 1, 4),                         ' de ', substring(./dtstart, 10, 2), 'h', substring(./dtstart, 12, 2),                         ' a ', substring(./dtend, 10, 2), 'h', substring(./dtend, 12, 2))"/>
		</li>
		<li>
			<b>Summary : </b><xsl:value-of select="./summary"/>
		</li>
		<li>
			<b>URL : </b><xsl:value-of select="./url"/>
		</li>
		<li>
			<b>Description : </b><xsl:value-of select="./description"/>
		</li>
	</xsl:template>
</xsl:stylesheet>
