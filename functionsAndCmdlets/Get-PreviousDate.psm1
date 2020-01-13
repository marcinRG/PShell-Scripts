Function Get-PreviousDate {Param ($daysAgo, $monthsAgo)
    $previousDate = Get-Date
    if ($daysAgo) {
       $previousDate = $previousDate.AddDays(-1*$daysAgo)
    }
    if ($monthsAgo) {
      $previousDate = $previousDate.AddMonths(-1*$monthsAgo) 
    }
    return $previousDate
  }