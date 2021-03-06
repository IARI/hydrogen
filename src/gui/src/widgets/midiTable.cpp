/*
 * Hydrogen
 * Copyright(c) 2002-2008 by Alex >Comix< Cominu [comix@users.sourceforge.net]
 *
 * http://www.hydrogen-music.org
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY, without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 */

#include "../Skin.h"
#include "MidiSenseWidget.h"
#include "midiTable.h"

#include <hydrogen/midi_map.h>
#include <hydrogen/Preferences.h>
#include <hydrogen/globals.h>
#include <hydrogen/midi_action.h>
#include <hydrogen/hydrogen.h>

#include <QHeaderView>

const char* MidiTable::__class_name = "MidiTable";

MidiTable::MidiTable( QWidget *pParent )
 : QTableWidget( pParent )
 , Object( __class_name )
{
	__row_count = 0;
	setupMidiTable();

	m_pUpdateTimer = new QTimer( this );
	currentMidiAutosenseRow = 0;
}


MidiTable::~MidiTable()
{
	for( int myRow = 0; myRow <=  __row_count ; myRow++ ) {
		delete cellWidget( myRow, 0 );
		delete cellWidget( myRow, 1 );
		delete cellWidget( myRow, 2 );
		delete cellWidget( myRow, 3 );
		delete cellWidget( myRow, 4 );
		delete cellWidget( myRow, 5 );
	}
}

void MidiTable::midiSensePressed( int row ){

	currentMidiAutosenseRow = row;
	MidiSenseWidget mW( this );
	mW.exec();

	QComboBox * eventCombo =  dynamic_cast <QComboBox *> ( cellWidget( row, 1 ) );
	QSpinBox * eventSpinner = dynamic_cast <QSpinBox *> ( cellWidget( row, 2 ) );


	eventCombo->setCurrentIndex( eventCombo->findText( mW.lastMidiEvent ) );
	eventSpinner->setValue( mW.lastMidiEventParameter );

	m_pUpdateTimer->start( 100 );	
}


void MidiTable::updateTable()
{
	if( __row_count > 0 ) {
		QComboBox * eventCombo =  dynamic_cast <QComboBox *> ( cellWidget( __row_count - 1, 1 ) );
		QComboBox * actionCombo = dynamic_cast <QComboBox *> ( cellWidget( __row_count - 1, 3 ) );
		QComboBox * action2Combo = dynamic_cast <QComboBox *> ( cellWidget( __row_count - 1, 5 ) );

		if( eventCombo == NULL || actionCombo == NULL || action2Combo == NULL) return;

		if( actionCombo->currentText() != "" && eventCombo->currentText() != ""  && action2Combo->currentText() != "" ) {
			insertNewRow("", "", 0, 0, "");
		}
	}
}


void MidiTable::insertNewRow(QString actionString , QString eventString, int eventParameter , int actionParameter, QString actionParameter2)
{
		MidiActionManager *aH = MidiActionManager::get_instance();

	insertRow( __row_count );
	
	int oldRowCount = __row_count;

	++__row_count;

	

	QPushButton *midiSenseButton = new QPushButton(this);
	midiSenseButton->setIcon(QIcon(Skin::getImagePath() + "/preferencesDialog/rec.png"));
	midiSenseButton->setToolTip( trUtf8("press button to record midi event") );

	QSignalMapper *signalMapper = new QSignalMapper(this);

	connect(midiSenseButton, SIGNAL( clicked()), signalMapper, SLOT( map() ));
	signalMapper->setMapping( midiSenseButton, oldRowCount );
	connect( signalMapper, SIGNAL(mapped( int ) ),
		 this, SLOT( midiSensePressed(int) ) );
	setCellWidget( oldRowCount, 0, midiSenseButton );



	QComboBox *eventBox = new QComboBox();
	connect( eventBox , SIGNAL( currentIndexChanged( int ) ) , this , SLOT( updateTable() ) );
	eventBox->insertItems( oldRowCount , aH->getEventList() );
	eventBox->setCurrentIndex( eventBox->findText(eventString) );
	setCellWidget( oldRowCount, 1, eventBox );
	
	
	QSpinBox *eventParameterSpinner = new QSpinBox();
	setCellWidget( oldRowCount , 2, eventParameterSpinner );
	eventParameterSpinner->setMaximum( 999 );
	eventParameterSpinner->setValue( eventParameter );


	QComboBox *actionBox = new QComboBox();
	actionBox->setEditable(true);
	connect( actionBox , SIGNAL( currentIndexChanged( int ) ) , this , SLOT( updateTable() ) );
	actionBox->insertItems( oldRowCount, aH->getActionList());
	actionBox->setCurrentIndex ( actionBox->findText( actionString ) );
	setCellWidget( oldRowCount , 3, actionBox );
	

	QSpinBox *actionParameterSpinner = new QSpinBox();
	
	setCellWidget( oldRowCount , 4, actionParameterSpinner );
	actionParameterSpinner->setValue( actionParameter);
	actionParameterSpinner->setMaximum( 999 );


	QComboBox *actionParameter2Box = new QComboBox();
	actionParameter2Box->setEditable(true);
	connect( actionParameter2Box , SIGNAL( currentIndexChanged( int ) ) , this , SLOT( updateTable() ) );

	H2Core::Preferences *pPref = H2Core::Preferences::get_instance();
	std::list<QString>::const_iterator cur_patternCategories;
	for( cur_patternCategories = pPref->m_patternCategories.begin(); cur_patternCategories != pPref->m_patternCategories.end(); ++cur_patternCategories )
	{
		if ( actionParameter2Box->currentText() != *cur_patternCategories ){
			actionParameter2Box->addItem( *cur_patternCategories );
		}
	}
	actionParameter2Box->setCurrentIndex ( actionParameter2Box->findText( actionParameter2 ) );

	setCellWidget( oldRowCount , 5, actionParameter2Box );
}


// method to encapsulate code to avoid code duplication in MidiTable::setupMidiTable
void MidiTable::insertNewRow( MidiAction * pAction, QString eventString, int eventParameter )
{
	bool ok;
	QString actionParameter, actionParameter3;
	int actionParameterInteger = 0;

	actionParameter = pAction->getParameter1();
	actionParameterInteger = actionParameter.toInt(&ok,10);

	actionParameter3 = pAction->getParameter3();

	if ( pAction->getType() == "NOTHING" ) return;

	insertNewRow(pAction->getType() , eventString , eventParameter , actionParameterInteger, actionParameter3 );
}

void MidiTable::setupMidiTable()
{
	MidiMap *mM = MidiMap::get_instance();

	QStringList items;
	items << "" << trUtf8("Event")  <<  trUtf8("Param.")  <<  trUtf8("Action") <<  trUtf8("Param.") <<  trUtf8("Param. 3") ;

	setRowCount( 0 );
	setColumnCount( 6 );

	verticalHeader()->hide();

	setHorizontalHeaderLabels( items );
	horizontalHeader()->setStretchLastSection(true);

	setColumnWidth( 0 , 25 );
	setColumnWidth( 1 , 155 );
	setColumnWidth( 2, 60 );
	setColumnWidth( 3, 250 );
	setColumnWidth( 4 , 60 );
	setColumnWidth( 5 , 250 );

	bool ok;
	std::map< QString , MidiAction* > mmcMap = mM->getMMCMap();
	std::map< QString , MidiAction* >::iterator dIter( mmcMap.begin() );
	
	for( dIter = mmcMap.begin(); dIter != mmcMap.end(); dIter++ ) {
		insertNewRow(dIter->second , dIter->first , 0 );
	}

	for( int note = 0; note < 128; note++ ) {
		insertNewRow(mM->getNoteAction( note ) , "NOTE" , note );
	}

	for( int parameter = 0; parameter < 128; parameter++ ){
		insertNewRow(mM->getCCAction( parameter ) , "CC" , parameter );
	}

	{
		insertNewRow(mM->getPCAction() , "PROGRAM_CHANGE" , 0 );
	}
	
	insertNewRow( "", "", 0, 0, "" );
}

void MidiTable::saveMidiTable()
{
	MidiMap *mM = MidiMap::get_instance();
	
	for ( int row = 0; row < __row_count; row++ ) {

		QComboBox * eventCombo =  dynamic_cast <QComboBox *> ( cellWidget( row, 1 ) );
		QSpinBox * eventSpinner = dynamic_cast <QSpinBox *> ( cellWidget( row, 2 ) );
		QComboBox * actionCombo = dynamic_cast <QComboBox *> ( cellWidget( row, 3 ) );
		QSpinBox * actionSpinner = dynamic_cast <QSpinBox *> ( cellWidget( row, 4 ) );
		QComboBox * actionPar2Combo = dynamic_cast <QComboBox *> ( cellWidget( row, 5 ) );

		QString eventString;
		QString actionString;

		if( !eventCombo->currentText().isEmpty() && !actionCombo->currentText().isEmpty() ){
			eventString = eventCombo->currentText();

			actionString = actionCombo->currentText();
		
			MidiAction* pAction = new MidiAction( actionString );

			if( actionSpinner->cleanText() != ""){
				pAction->setParameter1( actionSpinner->cleanText() );
			}

			if( !actionPar2Combo->currentText().isEmpty()){
				pAction->setParameter3( actionPar2Combo->currentText() );
			}

			if( eventString.left(2) == "CC" ){
				mM->registerCCEvent( eventSpinner->cleanText().toInt() , pAction );
			} else if( eventString.left(3) == "MMC" ){
				mM->registerMMCEvent( eventString , pAction );
			} else if( eventString.left(4) == "NOTE" ){
				mM->registerNoteEvent( eventSpinner->cleanText().toInt() , pAction );
			} else if( eventString.left(14) == "PROGRAM_CHANGE" ){
				mM->registerPCEvent( pAction );
			}
		}
	}
}
