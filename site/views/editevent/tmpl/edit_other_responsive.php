<?php
/**
 * @version 2.3.0-dev1
 * @package JEM
 * @copyright (C) 2013-2018 joomlaeventmanager.net
 * @copyright (C) 2005-2009 Christoph Lukes
 * @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 */
defined('_JEXEC') or die;

$max_custom_fields = $this->settings->get('global_editevent_maxnumcustomfields', -1); // default to All
?>
	<!-- CUSTOM FIELDS -->
	<?php if ($max_custom_fields != 0) : ?>
	<fieldset class="panelform">
    <legend><?php echo JText::_('COM_JEM_EVENT_CUSTOMFIELDS_LEGEND'); ?></legend>
		<dl class="adminformlist jem-dl-long">
			<?php
				$fields = $this->form->getFieldset('custom');
				if ($max_custom_fields < 0) :
					$max_custom_fields = count($fields);
				endif;
				$cnt = 0;
				foreach($fields as $field) :
					if (++$cnt <= $max_custom_fields) :
					?><dt><?php echo $field->label; ?></dt><dd><?php echo $field->input; ?></dd><?php
					endif;
				endforeach;
			?>
		</dl>
	</fieldset>
	<?php endif; ?>
  <p>&nbsp;</p>

	<!-- REGISTRATION -->
	<fieldset class="panelform">
    <legend><?php echo JText::_('COM_JEM_EVENT_REGISTRATION_LEGEND'); ?></legend>
		<dl class="adminformlist jem-dl">
		<?php if ($this->jemsettings->showfroregistra == 0) : ?>
			<dt><?php echo $this->form->getLabel('registra'); ?></dt><dd><?php echo JText::_('JNO'); ?></dd>
		<?php else : ?>
			<?php if ($this->jemsettings->showfroregistra == 1) : ?>
			<dt><?php echo $this->form->getLabel('registra'); ?></dt><dd><?php echo JText::_('JYES'); ?></dd>
			<?php else : ?>
			<dt><?php echo $this->form->getLabel('registra'); ?></dt><dd><?php echo $this->form->getInput('registra'); ?></dd>
			<?php endif; ?>
			<?php if ($this->jemsettings->regallowinvitation == 1) : ?>
			<dt><?php echo $this->form->getLabel('reginvitedonly'); ?></dt><dd><?php echo $this->form->getInput('reginvitedonly'); ?></dd>
			<?php endif; ?>
			<dt><?php echo $this->form->getLabel('unregistra'); ?></dt>
      <dd><?php echo $this->form->getInput('unregistra'); ?></dd>
			<dd><?php echo $this->form->getInput('unregistra_until'); ?> <span id="jform_unregistra_until2"><?php echo JText::_('COM_JEM_EDITEVENT_FIELD_ANNULATION_UNTIL_POSTFIX'); ?></span></dd>
			<dt><?php echo $this->form->getLabel('maxplaces'); ?></dt><dd><?php echo $this->form->getInput('maxplaces'); ?></</dd>
			<dt><?php echo $this->form->getLabel('waitinglist'); ?></dt><dd><?php echo $this->form->getInput('waitinglist'); ?></dd>
			<?php if ($this->jemsettings->regallowinvitation == 1) : ?>
			<dt><?php echo $this->form->getLabel('invited'); ?></dt><dd><?php echo $this->form->getInput('invited'); ?></dd>
			<?php endif; ?>
			<dt><?php echo $this->form->getLabel('booked'); ?><dt><dd><?php echo $this->form->getInput('booked'); ?></dd>
			<?php if ($this->item->maxplaces): ?>
			<dt><?php echo $this->form->getLabel('avplaces'); ?></dt><dd><?php echo $this->form->getInput('avplaces'); ?></dd>
			<?php endif; ?>
		<?php endif; ?>
		</dl>
	</fieldset>
  <p>&nbsp;</p>

	<!-- IMAGE -->
	<?php if ($this->item->datimage || $this->jemsettings->imageenabled != 0) : ?>
	<fieldset class="jem_fldst_image">
    <legend><?php echo JText::_('COM_JEM_IMAGE'); ?></legend>
		<?php if ($this->jemsettings->imageenabled != 0) : ?>
		<dl class="adminformlist jem-dl">
			<dt><?php echo $this->form->getLabel('userfile'); ?></dt>
        <?php if ($this->item->datimage) : ?>
          <dd>
            <?php echo JEMOutput::flyer($this->item, $this->dimage, 'event', 'datimage'); ?>
            <input type="hidden" name="datimage" id="datimage" value="<?php echo $this->item->datimage; ?>" />		
          </dd>
          <dt> </dt>
        <?php endif; ?>
        <dd><?php echo $this->form->getInput('userfile'); ?></dd>
        <dt> </dt>
				<dd><button type="button" class="button3 btn" onclick="document.getElementById('jform_userfile').value = ''"><?php echo JText::_('JSEARCH_FILTER_CLEAR') ?></button></dd>
				<?php if ($this->item->datimage) : ?>
          <dt><?php echo JText::_('COM_JEM_REMOVE_IMAGE'); ?></dt>
          <dd><?php
            echo JHtml::image('media/com_jem/images/publish_r.png', null, array('id' => 'userfile-remove', 'data-id' => $this->item->id, 'data-type' => 'events', 'title' => JText::_('COM_JEM_REMOVE_IMAGE'))); ?>
          </dd>
        <?php endif; ?>
			</li>
		</dl>
		<input type="hidden" name="removeimage" id="removeimage" value="0" />
		<?php endif; ?>
	</fieldset>
	<?php endif; ?>
  <p>&nbsp;</p>

	<!-- Recurrence -->
	<fieldset class="panelform">
    <legend><?php echo JText::_('COM_JEM_RECURRENCE'); ?></legend>
		<dl class="adminformlist jem-dl">
			<dt><?php echo $this->form->getLabel('recurrence_type'); ?></dt><dd><?php echo $this->form->getInput('recurrence_type'); ?></dd>
      <dt> </dt>
			<dd id="recurrence_output"><label></label></dd>
      <dt> </dt>
      <dd>
        <div id="counter_row" style="display: none;">
          <?php echo $this->form->getLabel('recurrence_limit_date'); ?>
          <?php echo $this->form->getInput('recurrence_limit_date'); ?>
          <br><div class="recurrence_notice"><small>
          <?php
          $anticipation = $this->jemsettings->recurrence_anticipation;
          $limitdate = new JDate('now +' . $anticipation . 'days');
          $limitdate = JemOutput::formatLongDateTime($limitdate->format('Y-m-d'), '');
          echo JText::sprintf(JText::_('COM_JEM_EDITEVENT_NOTICE_GENSHIELD'), $limitdate);
          ?></small></div>
        </div>
      </dd>
		</dl>
		<input type="hidden" name="recurrence_number" id="recurrence_number" value="<?php echo $this->item->recurrence_number;?>" />
		<input type="hidden" name="recurrence_byday" id="recurrence_byday" value="<?php echo $this->item->recurrence_byday;?>" />

		<script type="text/javascript">
		<!--
		var $select_output = new Array();
			$select_output[1] = "<?php
			echo JText::_('COM_JEM_OUTPUT_DAY');
			?>";
			$select_output[2] = "<?php
			echo JText::_('COM_JEM_OUTPUT_WEEK');
			?>";
			$select_output[3] = "<?php
			echo JText::_('COM_JEM_OUTPUT_MONTH');
			?>";
			$select_output[4] = "<?php
			echo JText::_('COM_JEM_OUTPUT_WEEKDAY');
			?>";

		var $weekday = new Array();
			$weekday[0] = new Array("MO", "<?php echo JText::_('COM_JEM_MONDAY'); ?>");
			$weekday[1] = new Array("TU", "<?php echo JText::_('COM_JEM_TUESDAY'); ?>");
			$weekday[2] = new Array("WE", "<?php echo JText::_('COM_JEM_WEDNESDAY'); ?>");
			$weekday[3] = new Array("TH", "<?php echo JText::_('COM_JEM_THURSDAY'); ?>");
			$weekday[4] = new Array("FR", "<?php echo JText::_('COM_JEM_FRIDAY'); ?>");
			$weekday[5] = new Array("SA", "<?php echo JText::_('COM_JEM_SATURDAY'); ?>");
			$weekday[6] = new Array("SU", "<?php echo JText::_('COM_JEM_SUNDAY'); ?>");

		var $before_last = "<?php
			echo JText::_('COM_JEM_BEFORE_LAST');
			?>";
		var $last = "<?php
			echo JText::_('COM_JEM_LAST');
			?>";
			start_recurrencescript("jform_recurrence_type");
		-->
		</script>

		<?php /* show "old" recurrence settings for information */
		if (!empty($this->item->recurr_bak->recurrence_type)) {
			$recurr_type = '';
			$nullDate = JFactory::getDbo()->getNullDate();
			$rlDate = $this->item->recurr_bak->recurrence_limit_date;
			if (!empty($rlDate) && (strpos($nullDate, $rlDate) !== 0)) {
				$recurr_limit_date = JemOutput::formatdate($rlDate);
			} else {
				$recurr_limit_date = JText::_('COM_JEM_UNLIMITED');
			}

			switch ($this->item->recurr_bak->recurrence_type) {
			case 1:
				$recurr_type = JText::_('COM_JEM_DAYLY');
				$recurr_info = str_ireplace('[placeholder]',
				                            $this->item->recurr_bak->recurrence_number,
				                            JText::_('COM_JEM_OUTPUT_DAY'));
				break;
			case 2:
				$recurr_type = JText::_('COM_JEM_WEEKLY');
				$recurr_info = str_ireplace('[placeholder]',
				                            $this->item->recurr_bak->recurrence_number,
				                            JText::_('COM_JEM_OUTPUT_WEEK'));
				break;
			case 3:
				$recurr_type = JText::_('COM_JEM_MONTHLY');
				$recurr_info = str_ireplace('[placeholder]',
				                            $this->item->recurr_bak->recurrence_number,
				                            JText::_('COM_JEM_OUTPUT_MONTH'));
				break;
			case 4:
				$recurr_type = JText::_('COM_JEM_WEEKDAY');
				$recurr_byday = preg_replace('/(,)([^ ,]+)/', '$1 $2', $this->item->recurr_bak->recurrence_byday);
				$recurr_days = str_ireplace(array('MO', 'TU', 'WE', 'TH', 'FR', 'SA', 'SO'),
				                            array(JText::_('COM_JEM_MONDAY'), JText::_('COM_JEM_TUESDAY'),
				                                  JText::_('COM_JEM_WEDNESDAY'), JText::_('COM_JEM_THURSDAY'),
				                                  JText::_('COM_JEM_FRIDAY'), JText::_('COM_JEM_SATURDAY'),
				                                  JText::_('COM_JEM_SUNDAY')),
				                            $recurr_byday);
				$recurr_num  = str_ireplace(array('5', '6'),
				                            array(JText::_('COM_JEM_LAST'), JText::_('COM_JEM_BEFORE_LAST')),
				                            $this->item->recurr_bak->recurrence_number);
				$recurr_info = str_ireplace(array('[placeholder]', '[placeholder_weekday]'),
				                            array($recurr_num, $recurr_days),
				                            JText::_('COM_JEM_OUTPUT_WEEKDAY'));
				break;
			default:
				break;
			}

			if (!empty($recurr_type)) {
		 ?>
				<hr class="jem-hr" />
				<p><strong><?php echo JText::_('COM_JEM_RECURRING_INFO_TITLE'); ?></strong></p>
				<dl class="adminformlist jem-dl">
					<dt><label><?php echo JText::_('COM_JEM_RECURRENCE'); ?></label></dt>
					<dd><input type="text" class="readonly" readonly="readonly" value="<?php echo $recurr_type; ?>"></dd>
					<dt><label> </label></dt>
					<dd><?php echo $recurr_info; ?></dd>
					<dt><label><?php echo JText::_('COM_JEM_RECURRENCE_COUNTER'); ?></label></dt>
					<dd><input type="text" class="readonly" readonly="readonly" value="<?php echo $recurr_limit_date; ?>"></dt>
				</dl>
		<?php
			}
		} ?>
	</fieldset>
