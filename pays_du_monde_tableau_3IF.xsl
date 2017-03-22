<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Thu Mar 16 21:40:55 CET 2017 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
				    Pays du monde 
				 </title>
			</head>
			<body style="background-color:white;">
				<h1>Les pays du monde</h1>
				<h2>Mise en forme par  :  (B3242)</h2>
				<ul>
					<li>Alex HUANG FENG</li>
					<li>Loïc SÉRAZIN</li>
				</ul>
				<xsl:apply-templates select="countries/metadonnees"/>
				<xsl:variable name="reg" select="//region[not(text()=preceding::region/text())]"/>
				<p>Continents (regions) : 
					<xsl:for-each select="$reg"> <xsl:value-of select="current()"/>
						(<xsl:value-of select="count(//country[region=current()/text()])"/> pays) , 
						
<xsl:comment>Il faut gerer les sans pays </xsl:comment>
					</xsl:for-each>
				</p>
				
				<p>
				Le pays ayant le plus de voisins frontaliers est : <span style="color:red" >FAUT FAIRE ENCORE LA REQUETE EN XPATH</span>
				
				</p>
				
				<xsl:for-each select="$reg">
					<xsl:variable name="subreg" select="//subregion[../region=current() and not(text()=preceding::subregion/text())]"/>
					<h3> Pays du continent : <xsl:value-of select="current()"/> par sous-régions :</h3>
					<xsl:for-each select="$subreg">
						<h4>
							<xsl:value-of select="current()"/>
						</h4>
						<table border="3" width="100%" align="center">
							<tr>
								<th>Nº</th>
								<th>Nom</th>
								<th>Capitale</th>
								<th>Voisins</th>
								<th>Coordonnées</th>
								<th>Drapeau</th>
							</tr>
							<xsl:apply-templates select="//country[subregion=current()]"/>
						</table>
					</xsl:for-each>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="/countries/metadonnees">
		<p style="text-align:center; color:blue;">
			Objectif : <xsl:value-of select="/countries/metadonnees/objectif"/>
		</p>
		<hr/>
	</xsl:template>
	<xsl:template match="country">
		<tr>
			<td>
				<xsl:value-of select="position()"/>
			</td>
			<td>
				<span style="color:green">
					<xsl:value-of select="name/common"/>
				</span> (<xsl:value-of select="name/official"/>) <br/>
				<xsl:apply-templates select="name/native_name[@lang='fra']/official"/>
			</td>
			<td>
				<xsl:value-of select="capital"/>
			</td>
			<td>
				<xsl:apply-templates select="borders"/>
			</td>
			<td>
				<xsl:apply-templates select="latlng"/>
			</td>
			<td>
				<xsl:apply-templates select="cca2"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="official">
		<span style="color:brown">
				Nom français : <xsl:value-of select="node()"/>
		</span>
	</xsl:template>
	<xsl:template match="borders">
		<xsl:value-of select="//country[cca3=current()]/name/official"/>
		<xsl:if test="position()!=last()">, </xsl:if>
	</xsl:template>
	<xsl:template match="latlng">
		<xsl:if test="position()!=last()">Latitude : <xsl:value-of select="node()"/>
			<br/>
		</xsl:if>
		<xsl:if test="position()=last()">Longitude : <xsl:value-of select="node()"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cca2">
		<img src="http://www.geonames.org/flags/x/{translate(node(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')}.gif" alt="" height="40" width="60"/>
	</xsl:template>
</xsl:stylesheet>
