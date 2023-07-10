<?php
/**
 * @version 4.0.1-dev1
 * @package JEM
 * @copyright (C) 2013-2023 joomlaeventmanager.net
 * @copyright (C) 2005-2009 Christoph Lukes
 * @license https://www.gnu.org/licenses/gpl-3.0 GNU/GPL
 */

defined('JPATH_BASE') or die;

use Joomla\CMS\Factory;

JFormHelper::loadFieldClass('list');

/**
 * CatOptions Field class.
 */
class JFormFieldCatOptions extends JFormFieldList
{
	/**
	 * The category options field type.
	 */
	protected $type = 'CatOptions';


	/**
	 * Create Input
	 * @see JFormFieldList::getInput()
	 */
	public function getInput()
	{
		$attr = '';

		// Initialize field attributes.
        $attr .= !empty($this->class) ? ' class="' . $this->class . '"' : '';
        $attr .= !empty($this->size) ? ' size="' . $this->size . '"' : '';
        $attr .= $this->multiple ? ' multiple' : '';
        $attr .= $this->required ? ' required aria-required="true"' : '';

        // To avoid user's confusion, readonly="true" should imply disabled="true".
        if ((string) $this->readonly == '1' || (string) $this->readonly == 'true' || (string) $this->disabled == '1'|| (string) $this->disabled == 'true')
        {
            $attr .= ' disabled="disabled"';
        }

        // Initialize JavaScript field attributes.
        $attr .= $this->onchange ? ' onchange="' . $this->onchange . '"' : '';

		// Get the field options.
		$options = (array) $this->getOptions();

		$jinput = Factory::getApplication()->input;
		$currentid = $jinput->getInt('id');

        $db = Factory::getContainer()->get('DatabaseDriver');
		$query	= $db->getQuery(true);
		$query->select('DISTINCT catid');
		$query->from('#__jem_cats_event_relations');
		$query->where('itemid = '. $db->quote($currentid));
		$db->setQuery($query);
		$selectedcats = $db->loadColumn();

		// Create a read-only list (no name) with a hidden input to store the value.
		if ((string) $this->readonly == '1' || (string) $this->readonly == 'true')
		{
			$html[] = JHtml::_('select.genericlist', $options, $this->name, trim($attr), 'value', 'text', $selectedcats,$this->id);
			$html[] = '<input type="hidden" name="' . $this->name . '" value="' . htmlspecialchars($selectedcats, ENT_COMPAT, 'UTF-8') . '"/>';
		}
		else
		// Create a regular list.
		{
			$html[] = JHtml::_('select.genericlist', $options, $this->name, trim($attr), 'value', 'text', $selectedcats,$this->id);
		}
		return implode($html);
	}


	/**
	 * Retrieve Options
	 * @see JFormFieldList::getOptions()
	 */
	protected function getOptions()
	{
		$options = JemCategories::getCategoriesTree();
		$options = array_values($options);

		// Pad the option text with spaces using depth level as a multiplier
		# the level has to be decreased as we are having a (invisible) root
		# treename is generated by the function so let's use that one instead of the Joomla way
		for ($i = 0, $n = (is_array($options) ? count($options) : 0); $i < $n; $i++)
		{
			/*
			if ($options[$i]->published == 1)
			{
				$options[$i]->text = str_repeat('- ', ($options[$i]->level - 1)) . $options[$i]->text;
			}
			else
			{
				$options[$i]->text = str_repeat('- ', ($options[$i]->level - 1)) . '[' . $options[$i]->text . ']';
			}
			*/

			$options[$i]->text = $options[$i]->treename;
		}

		// Merge any additional options in the XML definition.
		$options = array_merge(parent::getOptions(), $options);

		return $options;
	}
}
